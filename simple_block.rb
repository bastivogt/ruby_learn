
# def count(start = 1, stop = 10, step = 1, &block)
#   for i in (start..stop).step(step)
#     puts i
#   end
#   block.call
# end

# def count(start = 1, stop = 10, step = 1)
#   for i in (start..stop).step(step)
#     puts i
#   end
#   yield
# end

# def count(start = 1, stop = 10, step = 1, &block)
#   i = start
#   for i in (start..stop).step(step)
#     puts i
#   end
#   block.call(i)
# end

def count(start = 1, stop = 10, step = 1)
  i = start
  for i in (start..stop).step(step)
    puts i
  end
  yield(i)
end

count() do |i|
  puts "In the block, i: #{i}"
end