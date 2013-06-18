require_relative '../lib/Reminder'
require_relative '../lib/DB'

describe Reminder do
  let(:m){ Reminder.new Database.new }

  context ".new" do
    it "has no reminders initially" do
      expect(m.view).to eq "No reminders waiting"
    end
  end

  context ".add" do
    it "accepts a new reminder" do
      add_test_reminders(m, 1)
      expect(m.view).not_to be_empty
    end

    it "can add more than one reminder" do
      add_test_reminders(m, 2)
      expect(m.view.count).to eq 2
    end
  end

  context ".view" do
    context "when there are no reminders" do
      it "returns a message that there are no reminders" do
        expect(m.view).to eq "No reminders waiting"
      end
    end

    context "when there are reminders" do
      it "returns all the reminders" do
        add_test_reminders(m, 3)
        expect(m.view).not_to be_empty
      end
    end
  end
end

def add_test_reminders(o, test_count)
  test_count.times{|i| o.add "test#{i}" }
end

