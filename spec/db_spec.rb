require_relative '../lib/DB'
require 'json'

describe Database do
  let(:db){ Database.new }

  it "starts out empty" do
    expect(db.reminders).to be_empty
  end

  it "accepts new reminders" do
    db.save_reminder '{
        "message": "remember milk",
            "tags": [
                "testing",
                "breakfast"
            ]
        }'
    expect(db.reminders).to_not be_empty
  end

  it "returns all messages" do
    db.save_reminder '{"message": "remember milk"}'
    db.save_reminder '{"message": "eat your veggies"}'
    expect(db.messages).to eq ['remember milk', 'eat your veggies'].to_json
  end

  it "returns all messages for a specific tag" do
    db.save_reminder '{"message": "remember milk", "tags":["store", "breakfast"]}'
    db.save_reminder '{"message": "buy an umberella", "tags":["store", "rain"]}'
    db.save_reminder '{"message": "eat your veggies", "tags":["lunch"]}'
    db.save_reminder '{"message": "clean your plate"}'
    expect(db.messages(:tag => 'store')).to eq ["remember milk", "buy an umberella"].to_json
  end
end
