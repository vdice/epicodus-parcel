require('pry')
require('sinatra')
require('sinatra/reloader')
require('./lib/parcel.rb')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/parcel') do
  @width = params.fetch('width')
  @height = params.fetch('height')
  @depth = params.fetch('depth')
  @weight = params.fetch('weight')
  @service = params.fetch('service')
  @distance = params.fetch('distance')

  @parcel = Parcel.new(@width, @height, @depth, @weight, @service, @distance)
  @cost_to_ship = @parcel.cost_to_ship()
  erb(:parcel)
end
