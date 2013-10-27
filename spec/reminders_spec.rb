require "spec_helper"
require_relative "../lib/reminders"

describe Reminders do

  it "accepts a new reminder" do
    reminder = Reminders.add_reminder "Remember the milk"
    expect(reminder).to eql true
  end

  it "returns all reminders" do
    Reminders.add_reminder "Remember the milk"
    reminders = Reminders.get_reminders
    expect(reminders[0].reminder).to eql "Remember the milk"
  end
end
