require "bundler"
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restfuljeopardy'
)


# this method is just to add entries to the database when messing with/testing APISs
get '/' do
  jeop = Jeop.create({ :category => 'History', :value => 1000, :question => "Who is Grace Hopper?", :answer => "Coined the term \'debugging\' after finding a moth in her computer" }).to_json
end

get '/api/jeop' do
  Jeop.all.to_json
end

get '/api/jeops/:id' do
  puts params
  Jeop.find(params[:id]).to_json
end

post '/api/jeop' do
  puts params
  Jeop.create({
    :category => params[:category],
    :value => params[:value],
    :question => params[:question],
    :answer => params[:answer]
    }).to_json
end

  patch '/api/jeop/:id' do
    jeop_args = { :category => params[:category],
        :value => params[:value],
        :question => params[:question],
        :answer => params[:answer] }

    @jeop = Jeop.find(params[:id])
    @jeop.update(jeop_args)
    @jeop.to_json

  end

  #in case browser doesn't support patch

  put  '/api/jeop/:id' do
    jeop_args = {:category => params[:category],
        :value => params[:value],
        :question => params[:question],
        :answer => params[:answer]  }

    @jeop = Jeop.find(params[:id])
    @jeop.update(jeop_args)
    @jeop.to_json
  end

  delete '/api/jeop/:id' do
    Jeop.destroy(params[:id]).to_json
  end
