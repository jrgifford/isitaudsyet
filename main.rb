require 'rubygems'
require 'bundler/setup'
require 'sinatra'
set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  erb :index
end

