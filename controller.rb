require('sinatra')
require('sinatra/contrib/all')
require_relative('models/city')
require_relative('models/country')
also_reload('./models/*')

get '/cities' do
  @cities = City.all
  erb(:"cities/index")
end

get '/cities/new' do
  @country = Country.all
  erb(:"cities/new")
end

post '/cities' do
  City.new(params).save
  redirect to '/cities'
end

get '/cities/:id' do
  @city = City.find(params['id'])
  erb(:"cities/show")
end

get '/cities/:id/edit' do
  @countries = Country.all
  @city = City.find(params['id'])
  erb(:"cities/edit")
end

post '/cities/:id' do
  city = City.new(params)
  city.update
  redirect to "/cities/#{params['id']}"
end

post '/cities/:id/delete' do
  city = City.find(params['id'])
  city.delete
  redirect to '/cities'
end

get '/countries' do
  @countries = Country.all
  erb(:"countries/index")
end

get '/countries/new' do
  erb(:"countries/new")
end

post '/countries' do
  Country.new(params).save
  redirect to '/countries'
end

get '/countries/:id' do
  @country = Country.find(params['id'])
  erb(:"countries/show")
end

get '/countries/:id/edit' do
  @countries = Country.all
  erb(:"countries/edit")
end

post '/countries/:id' do
  country = Country.new(params)
  country.update
  redirect to "/countries/#{params['id']}"
end

post '/countries/:id/delete' do
  country = Country.find(params['id'])
  country.delete
  redirect to '/countries'
end
