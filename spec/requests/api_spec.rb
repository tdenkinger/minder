require_relative "../helpers/acceptance_helper"

describe "Mindasaurus", type: :request do
  def app
    Mindasaurus::API
  end

  def fetch_reminders
    get "/reminders"
    JSON.parse last_response.body
  end

  context "Users" do
    it "allows a new user to register" do
      post "/register", "username" => "jsmith", "password" => "SuperSecret", "email" => "john@example.com"
      expect(last_response.status).to eq 201
    end

    it "allows a user to log in" do
      post "/register", "username" => "jsmith", "password" => "SuperSecret", "email" => "john@example.com"
      post "/login", "username" => "jsmith", "password" => "SuperSecret"
      expect(last_response.status).to eq 201
    end
  end

  context "Reminders" do
    it "accepts new reminders" do
      post "/reminders", "reminder" => "walk the dog"
      expect(last_response.body).to eq "true"
    end

    context "retrieving all reminders" do
      it "returns no reminders when there are none" do
        res = fetch_reminders
        expect(res).to be_empty
      end

      it "returns one reminder" do
        post "/reminders", "reminder" => "walk the dog"
        res = fetch_reminders
        expect(res.first["reminder"]).to eq "walk the dog"
      end

      it "returns all reminders" do
        post "/reminders", "reminder" => "walk the dog"
        post "/reminders", "reminder" => "pick up milk"
        res = fetch_reminders
        expect(res.first["reminder"]).to eq "walk the dog"
        expect(res.last["reminder"]).to eq "pick up milk"
      end
    end

    context "retrieving specific reminders" do
      it "retrieves a reminder by id" do
        post "/reminders", "reminder" => "walk the dog"
        post "/reminders", "reminder" => "pick up milk"
        res = fetch_reminders
        id, reminder = res.last["id"], res.last["reminder"]
        get "/reminders/#{id}"
        res = JSON.parse last_response.body
        expect(res["reminder"]).to eq reminder
      end
    end
  end
end
