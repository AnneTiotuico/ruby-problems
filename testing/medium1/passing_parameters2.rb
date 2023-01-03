birds = %w(raven finch hawk eagle)
birds # => ['raven','finch','hawk','eagle']

raven, finch, hawk, eagle = %w(raven finch hawk eagle)
raven # => 'raven'
finch # => 'finch'
hawk # => 'hawk'
eagle # => 'eagle'

raven, finch, *raptors = %w(raven finch hawk eagle)
raven # => 'raven'
finch # => 'finch'
raptors  # => ['hawk','eagle']

def my_method(arr)
  yield(arr)
end

p my_method(birds) { |_, _, *raptors|
  raptors
}
