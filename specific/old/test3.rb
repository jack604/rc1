#Testing return values with if else, elsif code:

def f a, b, c
  if a<b
    print "max ", b, "\n"
	b=a
  elsif a>b
	print "max ", a, "\n"
	a=c
  elsif a==c
   print "hello\n"
  else
  	print "else\n"
  end
end

print f(1,2,3), " is printed out\n"
puts f 1,2,3


f 1,2,3
f 2,1,3

