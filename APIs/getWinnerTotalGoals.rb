require 'net/http'
require 'uri'
require 'json'


# 'https://jsonmock.hackerrank.com/api/football_competitions'
# El objetivo es traer la cantidad de goles del campoeon de cierta liga
# la funcion recibe como parametros el "nombre de la liga" y el "año"


def getWinnerTotalGoals(competition, year)

  url = URI("https://jsonmock.hackerrank.com/api/football_competitions?name=#{competition}&year=#{year}")
  response = Net::HTTP.get(url)
  parsed_data = JSON.parse(response)
  winner = parsed_data["data"][0]["winner"]
  
  results = 0
  
  ['team1', 'team2'].each do |localOrVisitor|
    page = 1
    loop do
      url = URI("https://jsonmock.hackerrank.com/api/football_matches?year=#{year}&#{localOrVisitor}=#{winner}&page=#{page}")
      response = Net::HTTP.get(url)
      data = JSON.parse(response)

      break if data['data'].empty?
      
      data['data'].each do |match|
        results += (match[localOrVisitor + 'goals'].to_i if match[localOrVisitor] == winner) if match['competition'] == competition
      end

      page += 1
    end
  end
  
  # Imprimimos el resultado total de goles del equipo ganador
  puts "El campeón fue #{winner} con un total de #{results} goles."
end

#English Premier League

r = getWinnerTotalGoals("UEFA Champions League", 2011)
puts r