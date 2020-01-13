require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
   configure do
     set :views, "app/views"
     set :public_folder, "public/stylesheets"
     enable :sessions
     set :session_secret, "secret"
   end

   get '/' do
     erb :index
   end
 end 
