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
      if tag.nil?
        messages << item["message"]
      else
        next unless item["tags"] && item["tags"].include?(tag)
        messages << item["message"]
      end
    end
    messages
  end

private

  def get_message(tag, i)
    item = parse_item(i)
    message = check_tags(tag, item)
    message
  end

  def parse_item(item)
    JSON.parse(item)
  end

  def check_tags(tag, item)
    return "" unless item["tags"]
    return "" unless item["tags"].include?(tag)
  end
end
