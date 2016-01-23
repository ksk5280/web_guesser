require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  if (guess - SECRET_NUMBER) > 5
    "way too high!"
  elsif (guess - SECRET_NUMBER) < -5
    "way too low!"
  elsif guess > SECRET_NUMBER
    "too high!"
  elsif guess < SECRET_NUMBER
    "too low!"
  else
    "the secret number! You got it right!"
  end
end
