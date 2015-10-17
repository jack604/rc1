require 'yaml'

myarray=["hello", "some", "more", "words"]
myhash=[key1: "value1", key2: "value2", key3: myarray]
puts myhash
out=File.open("out2.yaml", "w")
yamldata=YAML::dump(myarray)
puts yamldata
yamldata2=YAML::dump(myhash)
puts yamldata2

out.write(yamldata2)

#Ok, men sedan när man ska läsa tillbaka datat så måste man typ ha samma struktur som när man skrev det? Eller i alla fall veta om det?
#ok, den kommer bara skapa ett objekt precis som myhash är!
#Men om det skulle vara ett objekt så tror jag man måste typ definiera det först.

#Kan vara bra att läsa yaml-syntaxen, tyckte det hjälpte mig lite men kanske efter att hållit på en del.