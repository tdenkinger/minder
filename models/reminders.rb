module DB
  class Reminders
    include DataMapper::Resource

    property :id, Serial
    property :reminder, String

    def self.get_all
      self.all
    end

    def self.retrieve id
      if id
        self.get(id)
      else
        get_all
      end
    end

    def self.add_reminder reminder
      reminder = self.new( :reminder => reminder )
      reminder.save
    end
  end
end
