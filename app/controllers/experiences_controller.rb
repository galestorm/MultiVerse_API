class ExperiencesController < ApplicationController
  def index
    user = User.find_by uid: params[:uid].to_i
    user_id = user.id
    experiences = Experience.where("user_id = ?", user_id)
    experiences_with_poems = experiences.map {|e| {experience: e, poem: Poem.find(e.poem_id)}}
    render status: :ok, json: experiences_with_poems
  end

  def show
    experience = Experience.find(params[:id].to_i)
    if experience
      poem_id = experience.poem_id
      poem = Poem.find(poem_id)
      experience_with_poem = {experience: experience, poem: poem}
      render status: :ok, json: experience_with_poem
    else
      render status: :not_found
    end
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
    experience = Experience.find(params[:id].to_i)
  end

  def destroy
    experience = Experience.find(params[:id].to_i)
    if experience.destroy
      render status: :ok
    else
      render status: :bad_request
    end
  end
end
