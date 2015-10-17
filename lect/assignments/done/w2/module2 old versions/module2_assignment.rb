#Ok, det långa påtvingade oproduktiva tidsödslande detektivarbetet klart. I instruktionerna punkt 8 och 12 är det oklart vilka variabler man ska använda. Man ska spara arrayen med words i @highest_count_words_across_lines och inte i @print_highest_word_frequency_across_lines som det står att man ska göra i punkt 12.

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
    @print_highest_word_frequency_across_lines=[]
    @which_lines=[] #används för att hålla reda på vilka rader som har de flesta orden (delad etta).
    @analyzers.each do |analyzer| #Ok, för att spara vilken rad raderna med flest upprepade ord har måste man göra... förvänta sig att .each-funktionen går igenom varje element i turordning. Vet inte om det är riktigt så man ska göra om man ska vara helt korrekt eller vad man ska säga.
      if analyzer.highest_wf_count == @highest_count_across_lines
        @print_highest_word_frequency_across_lines << analyzer
      end
    end
    @highest_count_words_across_lines=@print_highest_word_frequency_across_lines
  end

  def print_highest_word_frequency_across_lines
    puts "The following lines have the highest word frequency per line:"
    @print_highest_word_frequency_across_lines.each { |analyzer| puts "#{ analyzer.highest_wf_words } (appears in line #{ analyzer.line_number})" }
    p 
  end
end

#s=Solution.new()
#s.analyze_file
#s.calculate_line_with_highest_frequency

#s.print_highest_word_frequency_across_lines

#solution = Solution.new
#expect errors until you implement these methods
#solution.analyze_file
#solution.calculate_line_with_highest_frequency
#solution.print_highest_word_frequency_across_lines