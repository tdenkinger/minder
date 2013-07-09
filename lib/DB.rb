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
      item = parse_item(i)
      message = get_message(tag, item)
      messages << message unless message.empty?
    end
    messages.to_json
  end

private

  def parse_item(item)
    JSON.parse(item)
  end

  def get_message(tag, item)
    return item["message"] if tag.nil?
    return get_message_by_tag(tag, item)
  end

  def get_message_by_tag(tag, item)
    return "" unless item["tags"]
    return item["message"] if item["tags"].include?(tag)
    ""
  end
end
