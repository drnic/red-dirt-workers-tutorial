class Application < Sinatra::Application
  get "/search" do
    @query = params[:q]
    @bank_results = Bank.search(@query)
    @weather_results = Weather.search(@query)
    erb :search
  end
end
