require 'sinatra'
require 'sinatra/cookies'
require_relative 'helpers/helpers.rb'

enable :sessions
set :session_secret, 'JGAJSHHGDAHSDGJGHJSJA8574386529FCTYXRDXRXRX5645453DER'

before '/home' do
  @tested_at = session[:tested_at]
  puts "FORMATED DATE: #{@tested_at}"
  if @tested_at && @tested_at.to_f < current_day
    session[:result] = nil
    session[:tested_at] = nil
  end
  @result = session[:result]
end

after '/test' do
  session[:result] = @result
  session[:tested_at] = @tested_at
end

get '/' do
  redirect '/home'
end

get '/home' do
  render_view 'home'
end

post '/test' do
  @result = %w[winner looser].sample
  @tested_at = current_day

  redirect '/home'
end

get '/*' do
  redirect '/404.html'
end
