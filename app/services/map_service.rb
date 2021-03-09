class MapService
  def self.get_coordinates(location)
    response = conn.get('geocoding/v1/address?') do |f|
      f.params[:key] = ENV['MAP_API_KEY']
      f.params[:location] = location
      f.params[:format] = 'jpg'
    end

    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0][:locations][0][:latLng]
  end

  def self.get_map(coordinates)
    "https://www.mapquestapi.com/staticmap/v5/map?key=#{ENV["MAP_API_KEY"]}&locations=#{coordinates[:lat]},#{coordinates[:lng]}"

    #response = conn.get('staticmap/v5/map?') do |f|
    #  f.params[:key] = ENV['MAP_API_KEY']
    #  f.params[:locations] = "#{coordinates[:lat]},#{coordinates[:lng]}"
    #end
    #response
  end
  def self.conn
    Faraday.new('https://www.mapquestapi.com/')
  end
end
#{:lat=>39.679371, :lng=>-104.893229} 
# mapquest example
#https://www.mapquestapi.com/staticmap/v5/map?key=KEY&locations=47.603229,-122.33028&size=1100,500@2x
#This works in Postman:
#https://www.mapquestapi.com/staticmap/v5/map?key=lEqLhOepdVCpmyz6y6eMQZt8jtRBUO0b&locations=39.679371,-104.893229
