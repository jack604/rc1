#Implement a class called LineAnalyzer.
class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
  def initialize(testline, linenumber)
    @line_number=linenumber
    @content=testline
    calculate_word_frequency
  end

  def calculate_word_frequency
    a=@content.downcase.split
    nH=Hash.new
    a.each { |word| nH[word]==nil ? nH[word]=1 : nH[word] = nH[word]+1}
    highest=0
    nH.each do |key, value|
      if value>highest
        highest=value
      end
    end
    @highest_wf_count= highest #kanske ska sätta in denna i loopen ovan. Obs att det är en setter-metod som anropas här som är förklädd till att ge värde.
    initarray=[]
    nH.each { |k,v| initarray << k if v==@highest_wf_count  }
    @highest_wf_words= initarray
  end

end

#  Implement a class called Solution. 
class Solution
  attr_reader :highest_count_across_lines, :highest_count_words_across_lines, :analyzers
  def initialize
    @analyzers=[]
    @qad_fix=[]
  end

  def analyze_file()
    linenum=1 #här förväntar man sig att raderna ska gås igenom i ordning, är det helt korrekt att göra det? Vad säger specifikationen för .foreach? Hur är det men .each?
    File.foreach('test.txt') do |line|
        @analyzers << LineAnalyzer.new(line, linenum) #varför ska linjenummret vara med?
        linenum+=1
    end
  end

  def calculate_line_with_highest_frequency
    @highest_count_across_lines=0
    @analyzers.each do |analyzer|
      if @highest_count_across_lines<analyzer.highest_wf_count
        @highest_count_across_lines=analyzer.highest_wf_count
      end
    end
    @print_highest_word_frequency_across_lines2=[]
    @which_lines=[] #används för att hålla reda på vilka rader som har de flesta orden (delad etta).
    @analyzers.each do |analyzer| #Ok, för att spara vilken rad raderna med flest upprepade ord har måste man göra... förvänta sig att .each-funktionen går igenom varje element i turordning. Vet inte om det är riktigt så man ska göra om man ska vara helt korrekt eller vad man ska säga.
      if analyzer.highest_wf_count == @highest_count_across_lines
        @print_highest_word_frequency_across_lines2 << analyzer.highest_wf_words
        @qad_fix << [analyzer.highest_wf_words, analyzer.line_number]
      end
    end
    @print_highest_word_frequency_across_lines2.reverse!
    @print_highest_word_frequency_across_lines=@print_highest_word_frequency_across_lines2.flatten.join(", ")
  end

  def print_highest_word_frequency_across_lines
    #p @print_highest_word_frequency_across_lines2.flatten
    #p @qad_fix
#    p  @print_highest_word_frequency_across_lines
    puts [1,2,3].to_s
    puts "The following lines have the highest word frequency per line:"
#    @print_highest_word_frequency_across_lines.each { |phw| puts "#{ phw[0]} (appears in line #{ phw[0]})" }
    @qad_fix.each { |phw| puts "#{ phw[0]} (appears in line #{ phw[1]})" }
  end
end

s=Solution.new()
s.analyze_file
s.calculate_line_with_highest_frequency

s.print_highest_word_frequency_across_lines

