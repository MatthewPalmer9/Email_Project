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

   get '/login' do
     erb :'/sessions/login'
   end

   post '/login' do
     @user = User.find_by(email: params[:email])
     if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect '/administrator/index'
     elsif @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect '/users/index'
     end
     redirect '/sessions/failure'
   end

   get '/signup' do
     erb :'/registrations/signup'
   end

   post '/signup' do
     if params[:username].empty? || params[:email].empty? || params[:password].empty?
       redirect '/registrations/failure'
     end

     @this_user = User.find_by(username: params[:username], email: params[:email])
     if @this_user
       redirect '/registrations/failure'
     end

     @user = User.new(username: params[:username], email: params[:email], password: params[:password])
     @user.save
     session[:user_id] = @user.id
     redirect '/users/index'
   end


   get '/administrator/index' do
     @user = current_user
     erb :'/administrator/index'
   end

   get '/clients' do
     @email = Email.all
     @user = current_user
     if @user.id != 1
       redirect '/sessions/failure'
     else
       erb :'/administrator/clients'
     end
   end

   get '/thankyou' do
     erb :thankyou
   end

   post '/clients/new' do
     @email = Email.new(name: params[:name], email: params[:email], phone_number: params[:phone_number], shoot_type: params[:shoot_type], optional_description: params[:optional_description])
     @email.save
     redirect '/thankyou'
   end

    get '/signout' do
      session.clear
      redirect '/'
    end

    #HELPERS
    helpers do
      def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end

  end
