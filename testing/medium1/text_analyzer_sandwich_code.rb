class TextAnalyzer
  def process
    file = File.open("sample_text.txt")
    stuff = file.read.split(yield)
    p stuff.length
  end
end

analyzer = TextAnalyzer.new
analyzer.process { /\n\n/ } #paragraphs
analyzer.process { /\n{1}/ } #lines
analyzer.process { /\b[a-z]+\b/i } #words