#basic styling
#more dynamic with a request parameter (in uri)
#routing rootpath

#ok, finns en nivå till på html-automatiseringen.
#views\layouts\...
#här finns t.ex. DOCTYPE, head, body m.m.
#page gets displayed inside the <body> </body> tag. <body> <#= yield %> </body>

#varje sida får sin layout från views\layout\...
#man kan override detta och välja annan layout o.s.v. men gås inte igenom i denna kurs.

#styling, CSS:
#css styrning finns i assets\stylesheets\controller-class.scss #fråga: är "en controller" bara en klass eller en fil som kan ha flera klasser?
#scss mer om .scss eller Sass här: https://en.wikipedia.org/wiki/Sass_(stylesheet_language)
#det är en superset av css så css fungerar också.
#också info i course 4 här. speciellt css classes.
#bra info ca 4:30 om tag classes typ och hur man använder dem.

#2 specify search term:
#params helper:
#a hash to retrieve the value (name of the (URI) parameter becomes a symbol/key in the Hash)
#? sista punkten ca 5:36
#aha, om man specificerar en hash-key som inte existerer så returneras nil. t.ex. myhash[:this_key_does_not_exists] => nil om inte nyckeln existerar.
#så @search_term = params[:looking_for] || 'jhu'
#viktigt, om det står courses/index?my_search_key=my_search_term så kommer det finnas en parameter i hashen
#med namn my_search_key som innehåller my_search_term

#3. routing:
#så man slipper ange den långa sökvägen t.ex.
#i routes.rb:
#root 'courses#index' #self explanatory typ. courses/index hittas från root-katalogen.


