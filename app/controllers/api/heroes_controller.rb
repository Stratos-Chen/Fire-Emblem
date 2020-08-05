class Api::HeroesController < ApplicationController
  

  def index
    # url = 'https://raw.githubusercontent.com/ajhyndman/fire-emblem-working-title/master/packages/fire-emblem-heroes-stats/stats.json'
    # uri = URI(url)
    # response = Net::HTTP.get(uri)
    # JSON.parse(response)
    response = HTTP.get('https://raw.githubusercontent.com/ajhyndman/fire-emblem-working-title/master/packages/fire-emblem-heroes-stats/stats.json')
    @heroes = JSON.parse(response.body)["heroes"]
    render "index.json.jb"
  end

  def show
    response = HTTP.get('https://raw.githubusercontent.com/ajhyndman/fire-emblem-working-title/master/packages/fire-emblem-heroes-stats/stats.json')
    @heroe = JSON.parse(response.body)["heroes"].detect {|hero| hero["name"] == params[:name].gsub('%20', ' ')}
    render "show.json.jb"
  end

end
