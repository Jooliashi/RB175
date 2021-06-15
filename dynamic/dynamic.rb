require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @list = Dir.glob("data/*").map {|file| File.basename(file)}.sort
  @list.reverse! if params[:sort] == "desc"

  erb :list
end
