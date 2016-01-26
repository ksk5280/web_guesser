require "sinatra"
require "sinatra/reloader"

SECRET_NUMBER = rand(99) + 1
@@guess_count

get "/" do
  guess = params["guess"].to_i
  message = check_guess(guess)[0]
  color = check_guess(guess)[1]
  cheat_mode
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color, :cheat_mode => cheat_mode}
end

def check_guess(guess)
  if guess == 0
    ["Guess the secret number from 1 to 100", "white"]
  elsif (guess - SECRET_NUMBER) > 5
    ["is way too high!", "red"]
  elsif (guess - SECRET_NUMBER) < -5
    ["is way too low!", "red"]
  elsif guess > SECRET_NUMBER
    ["is too high!", "#F9966B"]
  elsif guess < SECRET_NUMBER
    ["is too low!", "#F9966B"]
  else
    ["is the secret number! You got it right!", "green"]
  end
end

def cheat_mode
  if params["cheat"] == "true"
    "The secret number is #{SECRET_NUMBER}!"
  else
    ""
  end
end
