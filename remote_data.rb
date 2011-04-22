class RemoveData
  
end

class Bank < RemoteData
  def self.search(query)
    RestClient.get ENV["BANK_URL"], :params => query
  end
end

class Weather < RemoteData
  def self.search(query)
    RestClient.get ENV["WEATHER_URL"], :params => query
  end
end
