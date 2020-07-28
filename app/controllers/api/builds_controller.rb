class Api::BuildsController < ApplicationController
  before_action :authenticate_user

  def index
    @builds = current_user.builds
    render "index.json.jb"
  end
  def create
    @build = Build.new(
      name: params[:name],
      hero_name: params[:hero_name],
      hero_image_url: params[:hero_image_url],
      weapon_skill_name: params[:weapon_skill_name],
      assist: params[:assist],
      special: params[:special],
      passivea: params[:passivea],
      passiveb: params[:passiveb],
      passivec: params[:passivec],
      user_id: current_user.id
    )
    if @build.save
      render "show.json.jb"
    else
      render json: {errors: @build.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @build = Build.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @build = Build.find_by(id: params[:id])
    @build.name = params[:name] || @build.name
    @build.hero_name = params[:hero_name] || @build.hero_name
    @build.hero_image_url = params[:hero_image_url] || @build.hero_image_url
    @build.weapon_skill_name = params[:weapon_skill_name] || @build.weapon_skill_name
    @build.assist = params[:assist] || @build.assist
    @build.special = params[:special] || @build.special
    @build.passivea = params[:passivea] || @build.passivea
    @build.passiveb = params[:passiveb] || @build.passiveb
    @build.passivec = params[:passivec] || @build.passivec
    if @build.save
      render "show.json.jb"
    else
      render json: {errors: @build.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    build = Build.find_by(id: params[:id])
    build.destroy
    render json: {message: "Build deleted"}
  end
end
