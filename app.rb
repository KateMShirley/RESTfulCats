require "bundler"
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter =>'postgresql',
  :database =>'restfulcats'
)

get '/' do
  cat = Cat.create({ :name => 'Neko', :breed => "Moggie"}).to_json

  # Another way to wrtie
  # @cat = Cat.new
  # @cat.name = "Mowgli"
  # @cat.breed = "Feral"
  # @cat.save
  # @cat.to_json
end

get '/api/cats' do
  Cat.all.to_json
end

get '/api/cats/:id' do
  puts params
  Cat.find(params[:id]).to_json
end

post '/api/cats' do
  puts params
  Cat.create({
    :name => params[:name],
    :breed => params[:breed]
    }).to_json
end

#PATCH Update by ID
patch '/api/cats/:id' do
  cat_args = { :name => params[:name], :breed => params[:breed] }

  @cat = Cat.find(params[:id])
  @cat.update(cat_args)
  @cat.to_json

end

put '/api/cats/:id' do
  cat_args = { :name => params[:name], :breed => params[:breed] }

  @cat = Cat.find(params[:id])
  @cat.update(cat_args)
  @cat.to_json

end

delete '/api/cats/:id' do
  Cat.destroy(params[:id]).to_json
end
