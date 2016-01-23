require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)[0]
  color = check_guess(guess)[1]
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color}
end

def check_guess(guess)
  if (guess - SECRET_NUMBER) > 5
    ["way too high!", 'red']
  elsif (guess - SECRET_NUMBER) < -5
    ["way too low!", 'red']
  elsif guess > SECRET_NUMBER
    ["too high!", '#F9966B']
  elsif guess < SECRET_NUMBER
    ["too low!", '#F9966B']
  else
    ["the secret number! You got it right!", 'green']
  end
end
