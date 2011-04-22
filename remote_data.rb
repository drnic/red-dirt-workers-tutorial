class RemoteData
  
end

class Bank < RemoteData
  def self.search(query)
    JSON.parse(RestClient.get 'http://bank.heroku.com', :params => query)
  end
end

class Weather < RemoteData
  def self.search(query)
    JSON.parse(RestClient.get 'http://weather-weather.heroku.com', :params => query)
  end
end
