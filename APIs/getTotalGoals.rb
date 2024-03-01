require 'net/http'
require 'uri'
require 'json'


'https://jsonmock.hackerrank.com/api/football_matches'

# La funcion retorna un entero con la cantidad de goles convertidos 
# por el equipo durante ese año

# Parametros url:
# year
# team1 (equipo local)
# team2 (equipo visitante)
# page

def getTotalGoals(year, team)
    
    results = 0
    teams = ['team1', 'team2']

    teams.each do |localOrVisitor|
        page = 1
        loop do
            puts url = URI("https://jsonmock.hackerrank.com/api/football_matches?year=#{year}&#{localOrVisitor}=#{team}&page=#{page}")
            response = Net::HTTP.get(url)
            data = JSON.parse(response)

            break if data['data'].empty?

            data['data'].each do |match|
                puts match
                if match['team1'] == team
                    results += match['team1goals'].to_i
                end
                if match['team2'] == team
                    results += match['team2goals'].to_i
                end
            end

            page += 1
        end
    end
    results
end

r = getTotalGoals(2011, 'Manchester City')
puts r


