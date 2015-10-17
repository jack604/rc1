#constant scope testing.
Pi=3.1415
#Pi=4.1415 #ok går att ändra men man får en varning.
def circumference(radius)
	#Ok, man kan inte ens definiera en konstant inom en metod verkar det som.
	#Pi=6.1415
	#Bi=7.1415
	radius*2*Pi
end

class Circle
	#Pi=5.1415 #ingen varning vid omdefiniering inom ett annat scope.
	def initialize(radius)
		@radius=radius
	end

	def circumference
		@radius*2*Pi
	end
end

puts circumference(10)

c=Circle.new(20)
p c.circumference
