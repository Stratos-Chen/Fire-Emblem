class Api::SkillsController < ApplicationController

  def index
    @response = HTTP.get('https://raw.githubusercontent.com/ajhyndman/fire-emblem-working-title/master/packages/fire-emblem-heroes-stats/stats.json')
    render json: JSON.parse(@response.body)["skills"]
  end

end
