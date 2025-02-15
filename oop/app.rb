require "./Counter.rb"

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



c.event_dispatcher.add_listener(CounterEvent::COUNTER_STARTED) do |event|
  puts "#{event.type}, count: #{event.count}"
end

#c.event_dispatcher.add_listener(CounterEvent::COUNTER_UPDATED) {|event| puts "#{event.type}, count: #{event.count}"}

c.event_dispatcher.add_listener(CounterEvent::COUNTER_UPDATED) {|event| 
  puts "#{event.type}, count: #{event.count}"
}

c.event_dispatcher.add_listener(CounterEvent::COUNTER_FINISHED) do |event|
  counter_finish_handler event
end

#c.event_dispatcher.remove_listener CounterEvent::COUNTER_UPDATED

c.run


