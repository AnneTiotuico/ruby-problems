items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  items.each { |item| yield(item) }
  puts "Nice selection of food we have gathered!"
end

gather(items) { |item| puts item }