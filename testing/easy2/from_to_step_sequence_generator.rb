def step(starting, ending, step)
  value = starting
  loop do
    yield(value)
    break if value == ending
    value += step
  end
  value
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10