=begin
input: array of strings
output: one string
rules:
-an anagram is a word or phrase formed by rearranging ltters of a different word/phrase,
using original letters exactly once
-case sensitive, corn != CORN or Corn
-the anagram can't have more letters than the original word
-return the match in an array
-if no matches, return empty array

examples:
('corn')
%w(corn dark Corn rank CORN cron park)
the only anagram is ['cron']
-anagrams cant be the same word


('Orchestra')
%w(cashregister Carthorse radishes)
the only anagram is ['Carthorse']
-anagrams are case insensitive

data structures: arrays, strings

algorithm:
-initialize an empty `result` array result = []
-initialize variable `sorted_word` to sorted @word.downcase
-iterate through array of words |anagram|
  -next if @sorted_word == anagram.downcase
  -else if the @sorted_word == anagram.downcase.sort
    -add the `anagram` to `result` array
-return `result`
=end

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(array)
    result = []
    sorted_word = sort_word(word)
    array.each do |anagram|
      next if word == anagram.downcase
      result << anagram if sorted_word == sort_word(anagram)
    end
    result
  end

  private

  attr_reader :word

  def sort_word(word)
    word.downcase.chars.sort.join
  end

end