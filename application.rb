class Application < Sinatra::Application
  get "/search" do
    erb :search
  end
  
  get "/" do
    redirect '/search'
  end
  
  def self.fragment(fragment_name)
    obj = yield
    Application.get "/fragment/#{fragment_name}" do
      obj.request_attrs = params
      res               = obj.fetch
      instance_variable_set("@#{fragment_name}", res)
      erb "_#{fragment_name}".to_sym, :layout => false
    end
  end
  
  fragment("bank")    { Bank.new }
  fragment("weather") { Weather.new }
end
