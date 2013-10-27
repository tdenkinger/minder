require "json"

class Reminders
  def self.add_reminder reminder
    DB::Reminders.add_reminder reminder
  end

  def self.retrieve id = nil
    DB::Reminders.retrieve id
  end
end
