i = 1
j = 0
until i > 1000000
i *= 2
j += 1
end
puts "i = #{i}, j = #{j}"

#start debugger with: ruby –r debug debugtest.rb
#set breakpoints and “watches” (breakpoints that rely on a certain condition becoming true)
#some common commands: list, step [number], cont, break, watch, quit (se sid 214 i boken för mer detaljerad info)

#cont: Runs the program without stepping. Execution will continue until the program ends, reaches a breakpoint, or a watch condition becomes true.
#break: Sets a breakpoint at a particular line number, such as with break 3 to set a breakpoint at line 3.
#watch: Sets a condition breakpoint. Rather than choosing a certain line upon which to stop (or pause rather)

#man kan också typ ändra variabler t.ex. i=100 för att ändra i till 100
#läsa variabler: i för att läsa variabeln i

#??? sid 216: in situ?

#These are the tools you’ll use 99 percent of the time while debugging, and with practice the debugging environment can become a powerful tool, much like irb.
#However, many Ruby developers don’t use the debugger particularly often, as its style of debugging and its workflow can seem a little out of date compared to modern techniques such as test-driven development and unit testing