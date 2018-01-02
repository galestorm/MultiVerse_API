class PoemsController < ApplicationController

  def index
    #accept search terms as a string. Break into array in model method
    if params[:query]
      #search the lines and the title with this query
      poems = search_poems(params[:query])
      render status: :ok, json: poems
    else
      # unclear
    end
  end

  def show

  end
end
