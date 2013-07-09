require 'json'

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

  def messages(tag: nil)
    messages = []
    items.each do |i|
      messages << get_message(tag, i) unless message.empty?
    end
    messages
  end

private

  def get_message(tag, i)
    item = parse_item(i)
    message = check_tags(tag, item)
    messages << message unless message.empty?
  end

  def parse_item(item)
    JSON.parse(i)
  end

  def check_tags(tag, item)
    return "" unless item["tags"]
    return "" unless item["tags"].include?(tag)
  end
end
