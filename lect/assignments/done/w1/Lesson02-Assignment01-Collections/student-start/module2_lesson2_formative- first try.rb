# Grab 23 random elements between 0 and 10000
arr = (1..10000).to_a.sample(23)
p arr

# This selects only elements that when divided by 3 have a remainder of 0 
# using the % (modulus) operator
p arr.select { |element| element % 3 == 0 }
a2=arr.select { |element| element % 3 == 0 }
p a2
# Using `reject` method filter out anything less than 5000
# and use `sort` and `reverse` methods to sort in descending order
# Start with the line below and continue as 1 long method chain
# p arr.select { |element| element % 3 == 0 }

#locate numbers that:
#???? are from an array of numbers 1..10000 inclusive

a2.each { |element| print element/3.0 , " "}
print "\n"
#arr.each { |element| print element/3.0 , " "}

#1an verkar redan gjord
#2an verkar redan gjord.
#3an:
#not less than 5000. alltså 5000 och uppåt.
p arr.select { |element| element>=5000}
p arr.reverse