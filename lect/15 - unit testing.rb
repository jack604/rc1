#Tips: en del säger skriv testerna innan man börjar skriva koden. en del gör det efter.
#viktiga är att veta vikten av att skriva tests och ha "them in place" that actually tests and exercises your code.
#framework och när man skriver testerna inte lika crucial som ATT skriva tester.

#unit testing
#speciellt viktigt i dynamiskt språk (ruby), (odynamiska språk snappar upp typos t.ex. vid compileringen)

#refactor with confidence (restructure code)
#if make changes to code that passes and unit tests still passes after change => did not break anything.
#serves as documentation for developers (man ser hur man ska "run your code")

#ruby ships with Test::Unit

#1.8 Test::Unit was bloated, 1.9 reduced to a minimum.

#Test::Unit, member of XUnit family (JUnit, CppUnit) which means t.ex. att lot of languages has very similar frameworks.

#Basic Idea (to all these frameworks): write a class, extend it from a test class (in this case Test::Unit::TestCase)

#Prefix method names in that class with test_ (in the case of ruby)
#every test_ metod becomes it's own unique test that gets run when your class gets executed.

#if one test method fails others keep going.

#can use setup() and teardown() methods for setting up bahavior that will execute before (and after?) every test method in test-class.

#ok, typ en princip men vad är den där setup-metoden? vad var input-argumentet 'test'? 5:30 ca.

#Test can be automated as part of the build process.

#Many types of asserts.

#test for exceptions: assert_raise <exception that is expected> do, then it expects an exception to be raised.

#dot . means test has passed
#F means test has failed.
#Summary-raden längst ner: (antal) tests, assertions, failures, errros, pendings, omissions, notifications
#antar att failures är de viktigaste typ.


#16 Rspec:
#writing tests more descriptive, more english-like
#writing of the test is more intuitive and output bit more intuitive as well.

#installing rspec:
#gem install rspec

#rspec --init #creates a specs directory where all specs go plus some additional files (more later, not this lecture about additional files)

#describe() #top level method (set of related test or examples)
#takes either string or class as argument.
#all specs must go inside a describe block.
#no class to subclass, everything happends in the describe() method.

#before() and after() methods (similar to setup() and teardown() in MiniTest)

#can pass in either :each or :all (ingrequently used) to specifyu whether the block will run before/after each test or once before/after all tests.

#before :all could be useful, if for example you only want to connect to DB once.

#it  method - main logic happends here.
#takes an optional string to describe the behaviour being tested.

#känns som precis lika dant men annan syntax typ.

#run with command rspec

#17. nu: RSpec Matchers

#RSpec hangs to and not_to methods on all outcome of expectations
#to /not_to methods take one parameter, a matcher.
#be_true/be_false
#eq 3
#raise_error(SomeException?)

#be_predicate - boolean
#it "should sum two odd numbers and become even" do
# expect(@calculator.add(3,3).to be_even
# expect(@calculator.add(3,3).not_to be_odd
#end

#three dots => test passed.
#rspec --format documentation for more descriptive results. (skriver ut det som står efter it-metoden)

#More matchers, se relish-hemsidan rspec




