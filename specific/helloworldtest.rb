#testar rspec, mer info finns i filerna i spec-katalogen
#för att göra testet, kör rspec från en katalog som har spec\<test-files>.rb
#för mer info även om alla passes, kör rspec --format documentation

class Helloworldtest
	def gethelloworld
		return "hello world"
	end
end

a=Helloworldtest.new
a.gethelloworld
p a.gethelloworld

	
