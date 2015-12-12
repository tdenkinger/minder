require_relative "../helpers/acceptance_helper"

describe "Mindasaurus", type: :request do
  def app
    Mindasaurus::API
  end

  def fetch_reminder id
    env = {"api.tilt.root" => "views"}
    get "/reminders/reminder/#{id}", {}, env
    JSON.parse last_response.body
  end

  def fetch_reminders
    env = {"api.tilt.root" => "views"}
    get "/reminders", {}, env
    JSON.parse last_response.body
  end

  def post_new_reminder reminder, api_key = nil
    env = {"api.tilt.root" => "views"}
    post "/reminders", {"reminder" => reminder, "api_key" => api_key}, env
  end

  context "Users" do
    it "registers a valid user" do
      post "/register", "username" => "jsmith", "password" => "SuperSecret", "email" => "john@example.com"

      res = JSON.parse last_response.body
      expect(res["status"]).to eq "ok"
      expect(res["api_key"]).not_to be_empty
    end

    it "fails to register an invalid user" do
      post "/register", "username" => "jsmith", "password" => "SuperSecret", "email" => ""

      res = JSON.parse last_response.body
      expect(res["status"]).to eq "error"
      expect(res["api_key"][0]).to eq "Email must not be blank"
    end

    it "allows a user to log in" do
      post "/register", "username" => "jsmith", "password" => "SuperSecret", "email" => "john@example.com"
      post "/login", "username" => "jsmith", "password" => "SuperSecret"

      res = JSON.parse last_response.body
      expect(res["api_key"]).not_to be_empty
    end
  end

  context "Reminders" do
    it "accepts new reminders" do
      post_new_reminder "walk the dog"
      expect(last_response.body).to eq "{}"
    end

    context "retrieving all reminders" do
      it "returns no reminders when there are none" do
        res = fetch_reminders
        expect(res).to be_empty
      end

      it "returns one reminder" do
        post_new_reminder "walk the dog"

        res = fetch_reminders
        expect(res.first["reminder"]).to eq "walk the dog"
      end

      it "returns all reminders" do
        post_new_reminder "steal space elevator"
        post_new_reminder "conquer mars"

        res = fetch_reminders
        expect(res.first["reminder"]).to eq "steal space elevator"
        expect(res.last["reminder"]).to eq "conquer mars"
      end
    end

    context "retrieving specific reminders" do
      it "retrieves a reminder by id" do
        post_new_reminder "build lair"
        post_new_reminder "devise freeze ray"

        res = fetch_reminders
        id, reminder = res.last["id"], res.last["reminder"]

        res = fetch_reminder id
        expect(res["reminder"]).to eq reminder
      end

      it "retrieves reminders by api key" do
        post "/register", {"username" => "jsmith", "password" => "SuperSecret", "email" => "john@example.com"}, {"api.tilt.root" => "views"}
        api_key = JSON.parse(last_response.body)["api_key"]

        post_new_reminder "drink more ovaltine", api_key
        post_new_reminder "invent jetpack", api_key

        get "/reminders/#{api_key}", {}, {"api.tilt.root" => "views"}
        res = JSON.parse last_response.body
        expect(res.last["reminder"]).to eq "invent jetpack"
      end
    end
  end
end
