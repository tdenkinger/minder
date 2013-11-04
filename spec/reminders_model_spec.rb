require "helpers/spec_helper"

describe DB::Reminders do
  it "saves a new reminder" do
    status = DB::Reminders.add_reminder "This is a test"
    expect(status).to eq true
  end

  it "returns all reminders" do
    DB::Reminders.add_reminder "This is a test"
    DB::Reminders.add_reminder "This is another test"

    reminders = DB::Reminders.get_all
    expect(reminders.count).to eql 2
  end

  it "returns a specific reminder" do
    DB::Reminders.add_reminder "This is a test"
    DB::Reminders.add_reminder "This is another test"

    reminder = DB::Reminders.retrieve 2
    expect(reminder.reminder).to eql "This is another test"
  end
end
