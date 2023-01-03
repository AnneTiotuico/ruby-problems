class BeerSong
  def self.verse(bottles)
    lyrics = ''
      case bottles
        when 0 then lyrics << no_bottles
        when 1 then lyrics << one_bottle
        when 2 then lyrics << two_bottles
        else lyrics << generic_lyrics(bottles)
      end
    lyrics
  end

  def self.verses(bot1, bot2)
    lyrics = ''
    bot1.downto(bot2) do |bottle|
      lyrics << verse(bottle)
      lyrics << "\n" unless bottle == bot2
    end
    lyrics
  end

  def self.generic_lyrics(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num -1} bottles of beer on the wall.\n"
  end

  def self.two_bottles
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def self.one_bottle
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.no_bottles
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def self.lyrics
    verses(99, 0)
  end
end