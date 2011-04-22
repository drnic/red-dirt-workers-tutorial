class RemoteData
  attr_accessor :request_attrs
  
  def name
    self.class.to_s #.underscore
  end
  
  def fetch
    self.class.search(request_attrs[:q])
  end
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
