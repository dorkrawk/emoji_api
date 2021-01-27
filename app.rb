require 'sinatra/base'
require 'gemoji'
require 'json'

Dir["./models/*.rb"].each {|file| require file }

class App < Sinatra::Base

  get '/' do
    "hi"
  end

  get '/emjoify/:term' do
    content_type :json

    term = params[:term]
    emoji = Emoji.find_by_alias(term)&.raw
    status = ""
    message = ""
    content = ""

    if emoji
      status = "success"
      content = emoji
    else
      status = "failure"
      message = "sorry couldn't find an emoji for #{term}"
    end

    {
      status: status,
      message: message,
      content: content
    }.to_json
  end

  run! if app_file == $0
end

