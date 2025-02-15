require "./EventDispatcher.rb"
require "./CounterEvent.rb"

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