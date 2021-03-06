module Cache
  extend self

  def instance
    @@instance ||= Dalli::Client.new
  end

  def get(*args)
    instance.get(*args)
  end

  def set(*args)
    instance.set(*args)
  end
end

class RemoteData
  attr_accessor :request_attrs
  
  def name
    self.class.to_s #.underscore
  end
  
  def exists?
    not Cache.get(key).nil?
  end

  def key
    [name,query].join(":")
  end

  def instance
    JSON.parse(Cache.get(key))
  end

  def fetch
    QC.enqueue("::#{self.class}.search_and_set", key, query)
  end
  
  def self.search_and_set(key,query)
    ttl = 10
    result = search(query).to_json
    Cache.set(key,result,ttl)
  end

  def query
    request_attrs[:q]
  end

  def write_to_cache
    ttl = 10
    result = JSON.dump(yield)

    Cache.set(key, result, ttl)
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
