class Reminder
  attr_reader :reminders

  def initialize
    @reminders = []
  end

  def add(reminder)
    reminders << reminder
  end

  def view
    reminders.join("|")
  end
end
