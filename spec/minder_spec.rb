require_relative '../lib/Reminder'

describe Reminder do
  let(:m){ Reminder.new }

  context ".new" do
    it "has no reminders initially" do
      expect(m.reminders).to be_empty
    end
  end

  context ".add" do
    it "accepts a new reminder" do
      add_test_reminders(m, 1)
      expect(m.reminders).not_to be_empty
    end

    it "can add more than one reminder" do
      add_test_reminders(m, 2)
      expect(m.reminders.count).to eq(2)
    end
  end

  context ".view" do
    it "lists all the reminders" do
      add_test_reminders(m, 3)
      expect(m.view).not_to be_empty
    end
  end
end

def add_test_reminders(o, test_count)
  test_count.times{|i| o.add "test#{i}" }
end

