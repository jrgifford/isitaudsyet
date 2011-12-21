require 'rubygems'
require 'sinatra'
require 'date'
require 'haml'
set :public_folder, File.dirname(__FILE__) + '/static'


START_DATE = Date.parse("2012-5-7") unless defined?(START_DATE)
END_DATE = Date.parse("2012-5-11") unless defined?(END_DATE)


get '/' do
	if (START_DATE..END_DATE).include? Date.today
	 haml :show_yes
	else
	 days_left = (START_DATE - Date.today).to_i
     haml :show_no, :locals => {:days_left => days_left}
	end
end


enable :inline_templates
__END__

@@ layout
%html
  %head
    %title Is time for UDS yet?
    %link{:type => 'text/css', :rel => 'stylesheet', :href => '/screen.css'}
    %link{:type => 'text/css', :rel => 'stylesheet', :href => 'http://fonts.googleapis.com/css?family=Ubuntu:regular,bold&subset=Latin'}
    %link{:type => 'text/javascript', :rel => 'javascript', :href => '/google-a.js'}

  = yield

@@ show_yes
  %h1 YES

@@ show_no
%div#no
  %h1 NO
