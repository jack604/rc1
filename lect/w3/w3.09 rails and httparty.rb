#insert gem 'httparty', '0.13.5' in Gemfile
#stop server (gems are only loaded at startup), run bundle
#start server
#generate courses controller: rails g controller courses index

#Model:
#Now (finally) we use model:
#Det viktiga här är att det fungerar helt enkelt som man förväntar sig. controller är medveten om models by default. så använd models-klasser i controller-klassen no problem. Verkar inte ens behöva inkludeera något från de andra filerna typ.
#view har också koll på vad som finns i controller-klasserna (per automatik eller per automagik).
#i detta exempel används instansvariabler (eller getters snarare) från en klass i controller-trädet.
#eller är det getters? det är getter-function.each i alla fall.
#i detta exempel:
#i model: class coursera, def self.for
#i controller: class CoursesController, def index { @search_term, @courses} (inget typ attr_attributes här heller så antar att det inte är getters för att använda instans variables från controller.)

#skulle vilja ha lite mer info om hur saker hittar varandra, både i ruby och i rails och speciellt jämför ruby och rails i denna fråga.

#Documentation: http://www.rubydoc.info/github/jnunemaker/httparty/HTTParty/ClassMethods

#models/coursera.rb
#By convention, controllers anre named plural and models are named singular.
#hmm... bunler makes so HTTParty does not have to be required. (in model/coursera.rb-file) (i samband med rails?, andra tillfällen?) ?? mer info om detta typ.
#still have to include.

#om index.html.erb:
#image_tag view helper, generate image-tag typ.
#också, även om det är <% ... %> tag i viewern så gör den inget mer än att typ gära något flera gånger. Vet inte om man kommer att bli mer van och förstå bättre senare men...


