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
    reminders = db.reminders
    reminders.empty? ? "No reminders waiting" : reminders.to_json
  end
end
