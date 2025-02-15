require "./Event.rb"

class CounterEvent < Event
  COUNTER_STARTED = :COUNTER_STARTED
  COUNTER_UPDATED = :COUNTER_UPDATED
  COUNTER_FINISHED = :COUNTER_FINISHED

  def initialize(type, sender, count)
    super type, sender
    @count = count
  end
  attr_reader :count
end