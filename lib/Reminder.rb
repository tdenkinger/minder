class Reminder
  attr_reader :db

  def initialize database
    @db = database
  end

  def add reminder
    db.save_reminder reminder
  end

  def view
    db.reminders
  end
end
