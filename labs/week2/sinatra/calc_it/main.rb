require 'sinatra'
require 'sinatra/reloader' if development?

get '/calc_form' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  @operation = params[:operation]

  @result = case @operation
    when 'sum' then @first + @second
    when 'subtraction' then @first - @second
    when 'product' then @first * @second
    when 'division' then @first / @second
  end

  erb :calc_form
end