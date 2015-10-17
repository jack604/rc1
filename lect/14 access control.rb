#Encapsulation
#public, protected, private.

#Vad menar han med reciever eller explicit reciever? t.ex. 5:10-någonting
#testa att kolla: http://stackoverflow.com/questions/15592268/how-to-understand-sender-and-receiver-in-ruby

#!!! inconsistencies i ruby igen...
#med setters så får man använda self.setter_method= 10
#eftersom det där med att om man kör setter_method=10 direkt så tolkas det som gör ny lokal variabel och inte metodanrop.
#Vet inte om det är värt det för syntaktiskt socker. Kanske kunde göra setters som setter_method! eller något.