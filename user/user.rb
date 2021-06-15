require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"
require 'yaml'

before do
  @user_array = Psych.load_file("users.yaml")
end

helpers do
  def count_interests
    count = 0
    @user_array.each do |user, details|
      count += details[:interests].size
    end
    count
  end
end

get "/" do
  redirect "/users"
end

get "/users" do
  @user_names = @user_array.keys
  erb :user
end

get "/:name" do
  @email = @user_array[params[:name].to_sym][:email]
  @interests = @user_array[params[:name].to_sym][:interests]
  @other_users = @user_array.keys - [params[:name].to_sym]
  erb :individual
end
