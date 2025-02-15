class Event
  def initialize(type, sender)
    @type = type
    @sender = sender
  end

  attr_reader :type, :sender
end


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


class CounterEvent < Event
  COUNTER_STARTED = "COUNTER_STARTED"
  COUNTER_UPDATED = "COUNTER_UPDATED"
  COUNTER_FINISHED = "COUNTER_FINISHED"

  def initialize(type, sender, count)
    super type, sender
    @count = count
  end
  attr_reader :count
end


class Counter
  def initialize(start: 0, stop: 10, step: 1)
    @start = start
    @stop = stop
    @step = step
    @count = @start
    @event_dispatcher = EventDispatcher.init
  end

  attr_reader :count, :event_dispatcher

  def run
    @count = @start
    @event_dispatcher.dispatch_event(CounterEvent.new(CounterEvent::COUNTER_STARTED, self, @count))
    for @count in (@start..@stop).step(@step) do
      @event_dispatcher.dispatch_event(CounterEvent.new(CounterEvent::COUNTER_UPDATED, self, @count))
    end
    @event_dispatcher.dispatch_event(CounterEvent.new(CounterEvent::COUNTER_FINISHED, self, @count))
  end

  def this
    return self
  end
end



c = Counter.new

def counter_start_handler(event)
  puts "#{event.type}, count: #{event.count}"
end

def counter_update_handler(event)
  puts "#{event.type}, count: #{event.count}"
end

def counter_finish_handler(event)
  puts "#{event.type}, count: #{event.count}"
  puts event.sender.count
end

c.event_dispatcher.add_listener(CounterEvent::COUNTER_STARTED, method(:counter_start_handler))
c.event_dispatcher.add_listener(CounterEvent::COUNTER_UPDATED, method(:counter_update_handler))
c.event_dispatcher.add_listener(CounterEvent::COUNTER_FINISHED, method(:counter_finish_handler))

c.run



l = []
l.push({:type => "START", :listener => "ON_START"})




