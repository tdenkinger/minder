module DB
  class Reminders
    include DataMapper::Resource

    property :id, Serial
    property :reminder, String

    def self.get_all
      Reminders.all
    end

    def self.add_reminder reminder
      reminder = Reminders.new( :reminder => reminder )
      reminder.save
    end
  end
end
