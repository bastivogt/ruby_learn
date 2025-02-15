
def count(start: 0, stop: 10, step: 1, &update)
  i = start
  for i in (start..stop).step(step)
    # unless update.nil?
    #   update.call(i)
    # end
    update&.call(i)
  end
end

count do |i|
  puts "count update, i: #{i}"
end

puts "--------------------------------"

count(start: 10, stop: 20, step: 2) do |i|
  puts "count update, i: #{i}"
end

count