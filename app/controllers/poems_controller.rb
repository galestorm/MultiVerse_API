class PoemsController < ApplicationController

  def index
    #method only works for a 1-word query
    if params[:query]
      poems = Poem.search_poems(params[:query])
      render status: :ok, json: poems
    else
      #generate random poems if no query given
      #TODO
    end
  end

  def show
    poem = Poem.find(params[:id].to_i)
    render status: :ok, json: poem
  end
end
