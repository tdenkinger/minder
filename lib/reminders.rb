require "json"

class Reminders
  def self.add_reminder reminder
    DB::Reminders.add_reminder reminder
  end

  def self.get_reminders
    DB::Reminders.get_all
  end
end
