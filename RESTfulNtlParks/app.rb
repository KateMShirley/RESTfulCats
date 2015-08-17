require "bundler"
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restfulparks'
)


# this method is just to add entries to the database when messing with/testing APISs
get '/' do
  park = Park.create({ :name => 'Redwoods National Forest', :state => 'California', :latlong => "41° N, 124° W", :trail_miles => 200, :has_campground => true}).to_json
end

get '/api/parks' do
  Park.all.to_json
end

get '/api/parks/:id' do
  puts params
  Park.find(params[:id]).to_json
end

post '/api/parks' do
  puts params
  Park.create({
    :name => params[:name],
    :state => params[:state],
    :latlong => params[:latlong],
    :trail_miles => params[:trail_miles],
    :has_campground => params[:has_campground]
    }).to_json
end

  patch '/api/parks/:id' do
    park_args = {:name => params[:name], :state => params[:state], :latlong => params[:latlong], :trail_miles => params[:trail_miles], :has_campground => params[:has_campground] }

    @park = Park.find(params[:id])
    @park.update(park_args)
    @park.to_json

  end

  #in case browser doesn't support patch

  put  '/api/parks/:id' do
    park_args = {:name => params[:name], :state => params[:state], :latlong => params[:latlong], :trail_miles => params[:trail_miles], :has_campground => params[:has_campground] }

    @park = Park.find(params[:id])
    @park.update(park_args)
    @park.to_json
  end

  delete '/api/parks/:id' do
    Park.destroy(params[:id]).to_json
  end
