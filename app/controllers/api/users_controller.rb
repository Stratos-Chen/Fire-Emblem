class Api::UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :show]

  def show
    @user = current_user
    render "show.json.jb"
  end

  def create
    @user = User.new(
      email: params[:email],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      render "show.json.jb", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def update
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

  def destroy
    @user = current_user
    @user.destroy
    render json: {message: "User successfully destroyed!"}
  end
end