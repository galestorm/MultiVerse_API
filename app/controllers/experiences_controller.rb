class ExperiencesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    user = User.find_by uid: params[:uid].to_i
    poem = Poem.find(params[:poem_id].to_i)

    user_id = user.id
    poem_id = poem.id
    photo_id = params[:photoId]
    title = params[:title]
    notes = params[:notes]

    new_experience = Experience.new
    new_experience.user_id = user_id
    new_experience.poem_id = poem_id
    new_experience.photo_id = photo_id
    new_experience.title = title
    new_experience.notes = notes

    if new_experience.save
      render status: :ok, json: {status: "Successfully saved experience"}
    else
      render status: :bad_request
    end
  end

  def edit
  end

  def update
  end

  def delete
  end
end
