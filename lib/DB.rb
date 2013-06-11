class Database
  attr_reader :items

  def initialize
    @items = []
  end

  def reminders
    items
  end

  def save_reminder reminder
    items << reminder
  end

end
