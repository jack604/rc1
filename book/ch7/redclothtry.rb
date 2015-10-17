require 'rubygems'
require 'RedCloth'
#special eftersom ruby gems inte är del av standard ruby. sid 194

r = RedCloth.new("this is a *test* of _using RedCloth_")
puts r.to_html