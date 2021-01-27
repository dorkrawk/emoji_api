require 'sinatra/base'
require 'gemoji'

Dir["./models/*.rb"].each {|file| require file }

class App < Sinatra::Base

  get '/' do
    "hi"
  end

  get '/emjoify/:term' do
    term = params[:term]
    emoji = Emoji.find_by_alias(term)&.raw
    if emoji
      emoji
    else
      "sorry couldn't find an emoji for #{term}"
    end
  end

  run! if app_file == $0
end

