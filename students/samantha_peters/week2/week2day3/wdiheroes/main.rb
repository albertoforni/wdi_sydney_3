require 'sinatra'
require 'sinatra/reloader' if development?

# Homepage
get '/' do

erb :index

end

#About us/WDI page
get '/about' do

erb :about

end

#About us/WDI page
get '/contact' do

erb :contact

end

#conact form thanks
get '/thanks' do

erb :thanks

end

#404 page
get '/oops' do

erb :oops

end



#Sam's Page
get '/students/sam' do

erb :sam

end

#Lauren's Page
get '/students/lauren' do

erb :lauren

end

#Ed's Page
get '/students/ed' do

erb :ed

end

#Nick's Page

get '/students/nick' do

erb :nick

end