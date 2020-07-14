class Api::BuildsController < ApplicationController
  def index
    @builds = Build.all
    render "index.json.jb"
  end
  def create
    @build = Build.new(
      hero_name: params[:hero_name],
      hero_image_url: params[:hero_image_url],
      weapon_skill_name: params[:weapon_skill_name],
      assist: params[:assist],
      special: params[:special],
      passivea: params[:passivea],
      passiveb: params[:passiveb],
      passivec: params[:passivec]
    )
    if @build.save
      render "show.json.jb"
    else
      render json: {errors: @build.errors.full_messages}, status: unprocessable_entity
    end
  end

  def show
    @build = Build.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @build = Build.find_by(id: params[:id])
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
      render json: {errors: @build.error.full_message}, status: unprocessable_entity
    end
  end

  def destroy
    build = Build.find_by(id: params[:id])
    build.destroy
    render json: {message: "Build deleted"}
  end
end
