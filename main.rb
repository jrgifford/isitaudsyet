require 'rubygems'
require 'sinatra'
require 'date'
require 'haml'
set :public_folder, File.dirname(__FILE__) + '/static'


START_DATE = Date.parse("2012-1-11") unless defined?(START_DATE)
END_DATE = Date.parse("2012-1-13") unless defined?(END_DATE)


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
    %title is it codemash yet?
    %link{:type => 'text/css', :rel => 'stylesheet', :href => '/screen.css'}
  = yield

@@ show_yes
%h1 Yes

@@ show_no
%div#no
  %h1 No