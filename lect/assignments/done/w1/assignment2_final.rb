#some_var = "false"
#another_var = "nil"
some_var = false
another_var = nil

case
when some_var == "pink elephant"
  puts "Don't think about the pink elephant!"
when another_var.nil?
  puts "Question mark in the method name?"
when some_var == false
  puts "Looks like this one should execute"
else
  puts "I guess nothing matched... But why?"
end

#First of all: only the object nil and the boolean value false are considered false in ruby.
#1. some_var is the string "false" not "pink elephant".
#2. another_var is tested if nil-object but it is the string "nil" and not the nil-object.
#3. like the one above test if some_var is the boolean value false but it is not, it is the string "false"


#Lessons learned, seems like case testing stops at first successfull match.
