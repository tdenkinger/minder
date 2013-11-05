require "helpers/spec_helper"

describe DB::Reminders do
  let(:api_key){ "fake_api_key" }

  it "saves a new reminder" do
    status = DB::Reminders.add_reminder "This is a test", api_key
    expect(status).to eq true
  end

  it "returns all reminders" do
    DB::Reminders.add_reminder "This is a test", api_key
    DB::Reminders.add_reminder "This is another test", api_key

    reminders = DB::Reminders.get_all
    expect(reminders.count).to eql 2
  end

  it "returns a specific reminder" do
    DB::Reminders.add_reminder "This is a test", api_key
    DB::Reminders.add_reminder "This is another test", api_key

    reminder = DB::Reminders.retrieve 2
    expect(reminder.reminder).to eql "This is another test"
  end
end
