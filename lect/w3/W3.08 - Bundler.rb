#W3.08 - Bundler Typ package manager för ruby.
#gå till bundler.io
#bundler provides a consistent environment for ruby project by tracking and installing the exact gems and versions that are needed.

#lets you specify gems in root/Gemfile, (resolves gem dependencies automatically, bundler is prefered way)

#run bundle install or simply bundle after specifying a new gem in Gemfile

#bundle update when only modifying a version of a gem.

#also can specify different gems to be used in different modes (development, production, test m.m.)

#if no specification -> get latest
#can specify exact or approximiate version.
#gem "nokogiri" #latest
#gem "rails", "3.0.0.beta3" #exact version
#gem "rack", ">=1.0" #greater than
#gem "thin", ">= 1.1", "< 2.0" #lower and upper bounds
#gen "thin", "~>1.1" #pessimistic version constraint, don't use the final major release. Förstod inte riktigt hur dtta fungerade.

#OBS!!! Professorn sade till och med själv att de senaste versionerna ofta break things. Hmm... undrar
#om han menar typ deprecation och så eller om det är rena buggar.

#OBS!, kolla igen, 5:30 ca.
#sometimes the require statement name is different from the gem-name
#


#bundle exec
#??? fattade inte typ.