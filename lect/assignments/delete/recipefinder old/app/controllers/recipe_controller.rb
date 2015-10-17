class RecipeController < ApplicationController
  def index
#  	3. The RecipesController index action should
# check if a request parameter search was passed in.
# use the search term as the keyword if supplied, and use a default value of chocolate if not supplied
	#hur var det nu igen...
	#en helper params...
	@search_term = params[:search] || 'chocolate' #double pipe operation. om key (search) inte existerar så returneras nil och därmed används högra delen av ||
	
  end
end
