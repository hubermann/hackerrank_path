require 'net/http'
require 'uri'
require 'json'

# 'https://jsonmock.hackerrank.com/api/football_matches'
# Ver por año los partidos empatados.

def getDrawnMatches(year)
    
    results = 0
    teams = ['team1', 'team2']

    url = URI("https://jsonmock.hackerrank.com/api/football_matches?year=#{year}")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    total_pages = data['total_pages']

    (1..total_pages).each do |page|
        url = URI("https://jsonmock.hackerrank.com/api/football_matches?year=#{year}&&page=#{page}")
        response = Net::HTTP.get(url)
        data = JSON.parse(response)

        break if data['data'].empty?

        data['data'].each do |match|
            puts match
            if match['team1goals'] == match['team2goals'] 
                puts "*********** EMPATADO ****************"
                results += 1
            end
        end

        page += 1
    end
    results

end

r = getDrawnMatches(2011)

puts "Total empatados durante 2011 = #{r}"