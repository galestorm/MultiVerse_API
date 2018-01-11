class UsersController < ApplicationController
  def login
    user = User.find_by(uid: params[:uid].to_i)
    if !user
      new_user = User.new
      new_user.name = params[:name]
      new_user.uid = params[:uid]
      if new_user.save
        render status: :ok, json: {status: "success"}
      else
        render json: {status: "error"}
      end
    else
      render status: :ok, json: {status: "success"}
    end
  end
end
