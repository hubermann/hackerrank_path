require 'net/http'
require 'uri'
require 'json'


def getRelevantFoodOutlets(city,maxCost)
    page = 1
    results = []

    loop do 
        url = URI("https://jsonmock.hackerrank.com/api/food_outlets?city=#{city}&page=#{page}")
        response = Net::HTTP.get(url)
        data = JSON.parse(response)

        break if data['data'].empty?

        data['data'].each do |outlet|
            # verifico local por local si el precio es menor al precio maximo por dos personas
            if outlet['estimated_cost'] <= maxCost * 2
                results << outlet['name']
                #results << [outlet['name'], outlet['city'],outlet['estimated_cost']]
                #puts outlet
            end
        end

        page += 1
    end
    results
end


ciudad='Denver'
maximo = 50
results = getRelevantFoodOutlets(ciudad, maximo)


puts "Resultado: #{results}"



