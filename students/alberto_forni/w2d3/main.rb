require "sinatra"
require "sinatra/reloader" if development?
require 'Haml'
require 'active_support/all'
require 'pony'

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

helpers do
  def validate_presence(field, key)
    "You need to fill the #{key} field" unless field[key].present?
  end
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

    @errors = {}
    @errors[:email] = validate_presence(params, :email)
    @errors[:subject] = validate_presence(params, :subject)
    @errors[:emailtext] = validate_presence(params, :emailtext)

    if @errors.values.each 
      
    end

    options = {
      :to => 'alberto.forn@gmail.com',
      :from => 'alberto.forn@gmail.com',
      :subject => 'Test',
      :body => 'Test Text',
      #:html_body => (haml :test),
      :via => :smtp,
      :via_options => {
        :address => 'smtp.gmail.com',
        :port => 587,
        :enable_starttls_auto => true,
        :user_name => 'alberto.forn@gmail.com',
        :password => 'SARAciao1985',
        :authentication => :plain,
        :domain => 'HELO'
      }
    }

    Pony.mail(options)
  end

  haml :single
end

