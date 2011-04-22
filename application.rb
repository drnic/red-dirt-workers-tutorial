class Application < Sinatra::Application
  get "/search" do
    erb :search
  end
  
  get "/" do
    redirect '/search'
  end
  
  def self.fragment(fragment_name)
    obj = yield
    Application.get "/fragments/#{fragment_name}" do
      obj.request_attrs = params
      if obj.exists?
        instance_variable_set "@#{fragment_name}", obj.instance
        erb "_#{fragment_name}".to_sym, :layout => false
      else
        obj.fetch
        status 204
      end
    end
  end
  
  fragment("bank")    { Bank.new }
  fragment("weather") { Weather.new }
end
