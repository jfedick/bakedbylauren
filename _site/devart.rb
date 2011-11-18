require 'rubygems'
require 'sinatra'

set :public, Proc.new { File.join(root, "_site") }

# Added headers for Varnish
before do
  response.headers['Cache-Control'] = 'public, max-age=36000'
end


get '/*' do
	File.read("_site/#{params[:title]}/index.html")
end
