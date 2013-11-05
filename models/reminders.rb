module DB
  class Reminders
    include DataMapper::Resource

    property :id, Serial
    property :reminder, String
    property :api_key, String

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

    def self.retrieve_by_key api_key
      self.all(:api_key => api_key)
    end

    def self.add_reminder reminder, api_key
      reminder = self.new(:reminder => reminder, :api_key => api_key)
      reminder.save
    end
  end
end
