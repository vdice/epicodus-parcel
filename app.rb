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
  if params.has_key?('gift_wrap')
    @gift_wrap = params.fetch('gift_wrap')
  end

  @parcel = Parcel.new(@width, @height, @depth, @weight, @service, @distance, @gift_wrap)
  @cost_to_ship = @parcel.cost_to_ship()
  erb(:parcel)
end
