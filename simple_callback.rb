def counter(start: 0, stop: 10, step: 1, on_finish: nil, on_update: nil, on_start: nil)
  count = start
  unless on_start.nil?
    on_start.call(count)
  end
  for count in (start..stop).step(step) do
    unless on_update.nil?
      on_update.call(count)
    end
  end
  puts "FINISH"
  unless on_finish.nil?
    on_finish.call(count)
  end
end


def start_handler(count)
  puts "ON_START count: #{count}"
end

def update_handler(count)
  puts "ON_START count: #{count}"
end

def finish_handler(count)
  puts "ON_FINISH count: #{count}"
end

counter on_finish: method(:finish_handler), on_start: method(:start_handler), on_update: method(:update_handler), step: 2