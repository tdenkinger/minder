require_relative '../lib/Reminder'
require_relative '../lib/DB'

describe Reminder do
  let(:m){ Reminder.new Database.new }

  context ".new" do
    it "has no reminders initially" do
      expect(m.view).to eq "[]"
    end
  end

  context ".add" do
    it "accepts a new reminder" do
      expect(m.add "test").to eq :ok
    end

    it "persists the reminder" do
      m.add "{'message':'remember this'}"
      expect(m.view).to eq "[\"{'message':'remember this'}\"]"
    end
  end

  context ".view" do
    context "when there are no reminders" do
      it "returns an empty object" do
        expect(m.view).to eq "[]"
      end
    end

    context "when there are reminders" do
      it "returns all the reminders" do
        m.add "{'message':'remember this'}"
        m.add "{'message':'remember this too'}"
        expect(m.view).to eq "[\"{'message':'remember this'}\",\"{'message':'remember this too'}\"]"
      end
    end
  end
end

