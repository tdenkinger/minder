require "json"

class Reminders
  def self.add_reminder reminder
    1
  end

  def self.get_reminders
    reminders = [{ :id => 1, :reminder => "Number 1" }, {:id => 2, :reminder => "Number 2"}].to_json
  end
end
