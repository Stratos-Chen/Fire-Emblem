class Api::UsersController < ApplicationController
  before_action :authenticate_user

  def show
    @user = User.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    user = User.new(
      email: params[:email],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render "show.json.jb", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user == current_user
      @user = current_user
      @user.email = params[:email] || @user.email
      @user.username = params[:username] || @user.username
      if params[:password]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
      end
      if @user.save
        render "show.json.jb"
      else
        render json: { errors: @user.errors.full_messages }, status: :bad_request
      end
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: {message: "User successfully destroyed!"}
  end
end