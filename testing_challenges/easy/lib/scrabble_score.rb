=begin
input: word string
output: integer
rules:
-each letter has a determined value
-sum the value of all letters in each word
-letters will only be a-zA-Z (case insensitive)
-empty string, nil and white space characters will have a value of 0

examples:
'', " \t\n", nil all return 0
'a' = 0
'f' = 4
'OXYPHENBUTAZONE' = 41
o = 1
x = 8
y = 4
p = 3
h = 4
e = 1
n = 1
b = 3
u = 1
t = 1
a = 1
z = 10
o = 1
n = 1
e = 1


data structures: strings, integers, hash, array

algorithm:
-create a hash where keys are the score value and values are the letters
-initialize score variable to 0
-downcase given string `downcased_word`
-iterate through each letter of the word |letter|
  -add the score based on what key the letter matches with in the hash
-return score
=end



class Scrabble
  LETTER_SCORES = {
    1 => %w(a e i o u l n r s t),
    2 => %w(d g),
    3 => %w(b c m p),
    4 => %w(f h v w y),
    5 => %w(k),
    8 => %w(j x),
    10 => %w(q z)
  }
  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    score = 0
    return score unless valid_letter?
    @word.downcase.each_char do |letter|
      LETTER_SCORES.each do |key, value|
        score += key if value.include?(letter)
      end
    end
    score
  end

  def valid_letter?
    return false if @word.nil? || @word.empty?
    true if @word.match?(/[a-z]/i)
  end
end