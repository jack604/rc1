cur_weather = %Q{I'ts a hot day outside
Grab your umbrellas...}
puts
#puts cur_weather

cur_weather.lines do |l|
	l.sub! 'hot', 'rainy'
#	puts "#{l.strip}"
	puts "#{l}"
end
#Ok, ändrar inte cur_weather, bara varje nyskapad rad l vilka ändå försvinner sedan antar jag.
puts cur_weather
