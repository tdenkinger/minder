require_relative '../lib/DB'

describe Database do
  let(:db){ Database.new }

  it "starts out empty" do
    expect(db.reminders).to be_empty
  end

  it "accepts new reminders" do
    db.save_reminder "this is a test"
    expect(db.reminders).to_not be_empty
  end
end
