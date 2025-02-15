require "./Event.rb"

class EventDispatcher
  def initialize
    @listeners = {}
  end

  attr_reader :listeners

  def self.init
    return self.new
  end

  def has_listener(type)
    return @listeners.has_key? type
  end

  def add_listener(type, listener)
    unless has_listener type
      @listeners[type] = listener
      return true
    end
    return false
  end

  def remove_listener(type)
    if has_listener type
      @listeners.delete type
      return true
    end 
    return false
  end

  def dispatch_event(event)
    @listeners.each do | key, value |
      if key == event.type
        value.call(event)
      end

    end
  end
end