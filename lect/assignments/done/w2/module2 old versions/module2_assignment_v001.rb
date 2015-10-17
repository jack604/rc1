#Ev. fortsätt senare...

#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content,         - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)
  attr_reader :highest_wf_count, :hightest_wf_words, :content, :line_number
  #highest_wf_count:  int
  #highest_wf_words: Array of strings (the word(s) that were found the highest number of times, (fler ord om de delar första plats))

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result
  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.

  def initialize(testline, linenumber)
    @line_number=linenumber
    @content=testline
    calculate_word_frequency
  end

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.

  def calculate_word_frequency
    puts "calculate_word_frequency called"
#Ok, tänkte att göra det i en hash table. initiera till 1 om hittar ett ord som inte redan finns annars plussa med ett.

#sedan hitta ordet med högst värde i tabellen. och ta ut "nyckeln" för denna.

#fråga hur många olika ord ska man identifiera?
  
    #1. gör hash-lista med antal förekommande som value.
    a=@content.split
    p a
    nH=Hash.new
    a.each { |word| nH[word]==nil ? nH[word]=1 : nH[word] = nH[word]+1}
    puts nH.to_s
    #Hur identifierar man åt andra hållet nu då?
    #Gå igenom alla keys och jämför vilket värde som är högst?
    #Ok, men nu om det är flera ord är delad etta...
    highest=0
    nH.each do |key, value|
      if value>highest
        highest=value
        whatword=key
      end
      #Ok, för att dela etta, kanske räkna ut highest först och sedan kolla vilka keys som har detta värde.
      return [whatword, highest]

    end
  end

end

#  Implement a class called Solution. 
class Solution

  # Implement the following read-only attributes in the Solution class.
  #* highest_count_across_lines - a number with the value of the highest frequency of a word
  #* highest_count_words_across_lines - an array with the words with the highest frequency
  attr_reader :highest_count_across_lines, :highest_count_words_across_lines

  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers
  #* calculate_line_with_highest_frequency() - determines which line of
  #text has the highest number of occurrence of a single word
  #* print_highest_word_frequency_across_lines() - prints the words with the 
  #highest number of occurrences and their count
  
 
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  def analyze_file()
    arrayLinAnaly=[]
    linenum=0
    File.foreach('test.txt') do |line|
        arrayLinAnaly << LineAnalyzer.new(line, linenum)
        linenum+=linenum
    end
    return arrayLinAnaly
  end




  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the highest number of occurences of a word across all lines
  #and stores this result in the highest_count_across_lines attribute.
  #* identifies the words that were used with the highest number of occurrences
  #and stores them in print_highest_word_frequency_across_lines.

#  def calculate_line_with_highest_frequency


  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the result in the following format
  def print_highest_word_frequency_across_lines
    puts "The following lines have the highest word frequency per line:"
  end
end

a=LineAnalyzer.new("test test test word counting class", 1)
p a.calculate_word_frequency()