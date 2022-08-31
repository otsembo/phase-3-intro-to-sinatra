require 'sinatra'

class App < Sinatra::Base

  set :default_content_type, "application/json"

  get '/hello' do
    '<h2>Hello <em>World</em>!</h2>'
  end

  get '/potato' do
    "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  end

  get '/dice' do
    dice_roll = rand(1..6)
    "You have rolled #{dice_roll}"
  end

  get '/users' do
    user1 = { name: "Ian", "occupation" => "Software Developer" }
    user2 = {name: "Okumu", "occupation" => "Software Engineer" }
    {user: [user1, user2]}.to_json
  end

  get '/add/:n1/:n2' do
    n1 = params[:n1].to_i
    n2 = params[:n2].to_i

    sum = n1 + n2
    {"results" => sum}.to_json
  end
  
end

run App
