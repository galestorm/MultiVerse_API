class PoemsController < ApplicationController

  def index
    #method only works for a 1-word query
    if params[:query]
      poems = Poem.search_poems(params[:query]).shuffle
      if poems.length > 0
        render status: :ok, json: poems
      else
        poems = Poem.all.shuffle
        render status: :ok, json: poems
      end
    else
      poems = Poem.all.shuffle
      render status: :ok, json: poems
    end
  end

  def show
    poem = Poem.find(params[:id].to_i)
    render status: :ok, json: poem
  end
end
