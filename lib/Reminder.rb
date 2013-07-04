require 'json'

class Reminder
  attr_reader :db

  def initialize database
    @db = database
  end

  def add reminder
    db.save_reminder reminder
    :ok
  end

  def view
    db.reminders.to_json
  end
end
