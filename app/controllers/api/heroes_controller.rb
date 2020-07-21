class Api::HeroesController < ApplicationController
  

  def index
    # url = 'https://raw.githubusercontent.com/ajhyndman/fire-emblem-working-title/master/packages/fire-emblem-heroes-stats/stats.json'
    # uri = URI(url)
    # response = Net::HTTP.get(uri)
    # JSON.parse(response)
    @response = HTTP.get('https://raw.githubusercontent.com/ajhyndman/fire-emblem-working-title/master/packages/fire-emblem-heroes-stats/stats.json')
    render json: JSON.parse(@response.body)["heroes"]
  end

  def show
  end

end
