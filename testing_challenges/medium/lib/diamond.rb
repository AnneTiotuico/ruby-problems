class Diamond
  def self.make_diamond(letter)
    @@letter = letter
    @@total_space = (("A"..letter).to_a.length * 2) - 1
    return "A\n" if letter == "A"
    top_half + bottom_half
  end

  def self.top_half
    m_space = 3
    ("A"..@@letter).to_a.each_with_object("") do |alpha, str|
      case alpha
      when "A" then str << alpha.center(@@total_space) + "\n"
      when "B" then str << "#{alpha} #{alpha}".center(@@total_space) + "\n"
      else
        str << "#{alpha}#{' ' * m_space}#{alpha}".center(@@total_space) + "\n"
        m_space += 2
      end
    end
  end

  def self.bottom_half
    m_space = @@total_space - 4
    ("A"...@@letter).to_a.reverse.each_with_object("") do |alpha, str|
      str << case alpha
             when "A" then alpha.center(@@total_space) + "\n"
             when "B" then "#{alpha} #{alpha}".center(@@total_space) + "\n"
             else
               "#{alpha}#{' ' * m_space}#{alpha}".center(@@total_space) + "\n"
             end
      m_space -= 2
    end
  end
end
