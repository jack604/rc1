require 'rspec' #om inte denna så måste man använda Rspec.describe istället för bara describe.
require_relative '..\helloworldtest'

#? 4:40 förstod inte describe String or Class

#describe, top level method, set of related tasks or methods. takes either string or class.
#describe kan också anropas i describe. Det blir som separerade contexts typ? eller?
#all specs goes into a describe block.'
#everything happends inside the describe method.
#also before() and after() methods(inside the describe method), (arguments are code snippets, hmmm both for it and before?)
#förstod inte :each och :all ca 2:50

#main logic inside the it() method, defines the actual RSpec specifications/examples.
#takes an optional description string (jsut for description, no logic or functionality typ)

#require och require_relative, man behöver typ require en fil som innehåller det man vill testa.



describe Helloworldtest do #förstod inte vad man skulle ha efter describe riktigt.
	before { @hw=Helloworldtest.new }
	it "should return hello world" do
		expect(@hw.gethelloworld).to eq "hello world"
	end
end
#finns fler matchers, fler än .to som i exemplet ovan.


#ok ändringar innan det fungerade:
#before: require 'helloworldtest'
#describe helloworldtest ...
#enkla ändringar men describe-argumentet måste vara namnet på en riktig klass verkar det som.
#require måste hitta filen den ska testa från spec-katalogen.

#nu är det bara att fixa källkoden, i detta fall ett mellanslag som saknas i "helloworld"-stringen.