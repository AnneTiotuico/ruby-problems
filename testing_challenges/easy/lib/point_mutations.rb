class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    return 0 if strand == distance

    mutations = 0
    strand.chars.each_with_index do |letter, idx|
      next if distance.chars[idx].nil?

      mutations += 1 unless letter == distance.chars[idx]
    end
    mutations
  end

  private
  attr_reader :strand
end
