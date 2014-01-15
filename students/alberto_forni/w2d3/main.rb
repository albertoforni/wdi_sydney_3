require "sinatra"
require "sinatra/reloader" if development?
require 'Haml'
require 'active_support/all'

before do
  @students = {
    alberto: {
      text: "Blah Blah",
      picture_link: "http://www.gravatar.com/avatar/09b58cf6e5b587a7c2be39eba7c7ec17.png"
    },
    pranava: {
      text: "Blah Blah",
      picture_link: "http://www.gravatar.com/avatar/9feed97ff0feecf9551909af719e3107.png"
    },
    luke: {
      text: "Blah Blah",
      picture_link: "http://www.gravatar.com/avatar/1009a729390c7ace5fea8edd1c4178b8.png"
    },
    emily: {
      text: "Blah Blah",
      picture_link: "http://www.gravatar.com/avatar/dcc98d8ba3e3590c09d5c4a177a548bd.png"
    }
  }
end

get "/" do

  haml :index
end

get '/students/:name' do
  if params[:name].present?
    @student_name = params[:name]

    redirect '/' unless @students.keys.include?(@student_name.to_sym)

    @student = @students[@student_name.to_sym]
  end
  
  haml :single
end

get '/about' do

  haml :about
end

post '/students/:name' do
  if params[:name].present?

    @student_name = params[:name]
    
    redirect '/' unless @students.keys.include?(@student_name.to_sym)

    @student = @students[@student_name.to_sym]

    @errors = params[:email]

    @message = "Thanks"
  end

  haml :single
end

