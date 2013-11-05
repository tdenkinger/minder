require "helpers/spec_helper"
require_relative "../lib/reminders"

describe Reminders do
  let(:api_key){ "fake_api_key" }

  it "accepts a new reminder" do
    reminder = Reminders.add_reminder "Remember the milk", api_key
    expect(reminder).to eql true
  end

  context "returns reminders" do
    before(:each) do
      Reminders.add_reminder "Remember the milk", api_key
      Reminders.add_reminder "Walk the dog", api_key
    end

    it "returns all reminders" do
      reminders = Reminders.retrieve
      expect(reminders[0].reminder).to eql "Remember the milk"
      expect(reminders[1].reminder).to eql "Walk the dog"
    end

    it "returns a specific reminder" do
      reminders = Reminders.retrieve 2
      expect(reminders.reminder).to eql "Walk the dog"
    end
  end
end
