class ApplicationController < Sinatra::Base

set :default_content_type, "application/json"

get '/bakeries' do 
   bake = Bakery.all
   bake.to_json
end

get '/bakeries/:id' do
  bake = Bakery.find(params[:id])
  bake.to_json(include: :baked_goods)
end

get '/baked_goods/by_price' do 
  bake = BakedGood.order(price: :desc)
  bake.to_json
end

get '/baked_goods/most_expensive' do 
  bake = BakedGood.order(price: :desc).first

  bake.to_json
end



end
