require "json"

class Reminders
  def self.add_reminder reminder, api_key
    DB::Reminders.add_reminder reminder, api_key
  end

  def self.retrieve id = nil
    DB::Reminders.retrieve id
  end

  def self.retrieve_by_key api_key
    DB::Reminders.retrieve_by_key api_key
  end
end
