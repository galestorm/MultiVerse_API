class SavedPoemsController < ApplicationController

  def index
  end

  def create
    user = User.find_by uid: params[:uid].to_i
    poem =  Poem.find(params[:poem_id].to_i)
    user_id = user.id
    poem_id = poem.id
    saved_poem = SavedPoem.where("user_id = ? AND poem_id = ?", user_id, poem_id)
    if saved_poem.length != 0
      render status: :ok, json: {status: "Poem is saved for later"}
    else
      saved_poem = SavedPoem.new
      saved_poem.user_id = user_id
      saved_poem.poem_id = poem_id
      if saved_poem.save
        render status: :ok, json: {status: "Poem is saved for later"}
      else
        render status: :bad_request
      end
    end
  end

  def delete
  end
end
