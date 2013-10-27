require "spec_helper"
require_relative "../lib/reminders"

describe Reminders do

  it "accepts a new reminder" do
    reminder_id = Reminders.add_reminder :reminder => "Remember the milk"
    expect(reminder_id).to eql 1
  end

  it "returns all reminders" do
    reminders = Reminders.get_reminders
    # expect(reminders[0][:id]).to eql ""
  end
end
