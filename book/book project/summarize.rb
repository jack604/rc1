#summarize.rb
#leta efter "<substantiv> är" i en text för att hitta "intressanta meningar". Också normallånga meningar, inte för korta eller för långa.

#Kopierat från boken:
text = %q{
Ruby is a great programming language. It is object oriented
and has many groovy features. Some people don't like it, but that's
not our problem! It's easy to learn. It's great. To learn more about Ruby,
visit the official Ruby Web site today.Another sentence.
}

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|\!/) #gsub: substitute method, strip tar bort inledande och avslutande whitespaces (obs ej i mitten), split delar upp en sträng till substrängar i en array.
#print "   hello world ".strip #.split #(/o/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1) #OBS slice arguments: slice(start, length) → new_ary or nil Alltså första är start och andra är längd och INTE end eller vad man ska säga. Alltså inte först och sista.
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
puts ideal_sentences.join(". ")

sentences_sorted2 = sentences.sort_by { |sentence| sentence }
sentences_sorted2.each {|str| print "BEGIN", str, "END\n" }
sentences.each { |str| puts str}
#Fråga: är det inte bättre att sortera ut is|are-meningar först och efter det välja ett antal (istället för innan).


p sentences
s1=text.gsub(/\s+/, ' ').strip
p s1
#Ok, strip tar bara bort whitespace först och sist. Inte efter meningar så måste göra det själv typ. Test1:
s2=s1.split(/\. |\? |\! |\.|\?|!/)
p s2
#Ok fungerade på det sättet. Vet inte om ordningen i .split spelar någon roll. Kanske det blir whitespaces om man har fel ordning.

s3=s1.split(/\.|\?|\!|\. |\? |! /)
p s3

#Japp som jag misstänkte. Den tar det första den hittar. Alltså conditionsen är från vänster till höger och sedan tar första den hittar.

s3.each { |str| str.strip! } #Detta ska ta bort whitespaces först och sist i alla meningar.

p s3 #Ok, det fungerade också.