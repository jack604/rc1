class RecipesController < ApplicationController
  def index
  		@search_term = params[:search] || 'chocolate' #double pipe operation. om key (search) inte existerar så returneras nil och därmed används högra delen av ||
  end
end
