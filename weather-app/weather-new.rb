require 'yahoo-weatherman'

def get_location(location)
    client = Weatherman::Client.new
    client.lookup_by_location(location)
end

weather = get_location('10022')

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|
    
    day = forecast['date']
    
    weekday = day.strftime('%w').to_i
    
    if weekday == today
        dayName = 'Today'
        elsif weekday == today + 1
        dayName = 'Tomorrow'
        else
        dayName = day.strftime('%A')
        end
    
    puts dayName + ' is going to be ' +
    forecast['text'].downcase + ' with a low of ' + forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s
    end

def display_weather_message
    case temp
        when temp >= 95
        puts "Whoa! That is one hot place! Stay cool and drink lots of water!"
        when temp >= 80 && <= 94
        puts "Feeling hot! Hot! Hot! Feel like partying in the Caribbean!"
        when temp > 65 && < 80
        puts "This is perfect weather! Enjoy the outdoors!"
        when temp >= 50 && < 65
        puts "This is a bit chilly. Make sure you have a jacket."
        when temp >= 32 && < 50
        puts "It's chilly outside. Put your coat on when you go out"
        when temp >= 0 && < 32
        puts "It's below freezing. BRRRRRRR! It's cold. Put your coat, gloves, and boots on. And have some cocoa and your favorite hot soup."
        when temp < 0
        puts "Are you crazy to be in this weather? Stay inside and warm up with cocoa and a good book. Or better yet, move to Florida or Hawaii or fly to the Caribbean, kiddo!"
        end
    end

def get_weather(location)
    client = Weatherman::Client.new
    client.lookup_by_location(location).condition['text']
    /Users/gretchen/Documents/weather-app/weather.rb
end

def get_temp(location)
    client = Weatherman::Client.new
    client.lookup_by_location(location).condition['temp']
    
end

def get_city(location)
    client = Weatherman::Client.new
    client.lookup_by_location(location).location['city']
    
end

get '/' do
    "#{@message}"
    erb :home
end


post '/weather' do
	@post = params[:post]['location']
	@weather = get_weather(@post).downcase
    @temp = (get_temp(@post)*1.8+32).round.to_s
    @city = get_city(@post)
    
	"#{@weather}"
    
	if (@weather == 'sunny')
		erb:sunny
        elsif (@weather =='cloudy')
		erb:cloudy
        elsif (@weather == 'partly cloudy')
		erb :cloudy
        elsif (@weather =='rainy')
		erb :rainy
        elsif (@weather =='snowy')
		erb :snowy
        elsif (@weather == 'foggy')
		erb :foggy
        elsif (@weather == 'stormy')
        erb :stormy
        elsif (@weather == 'severe')
        erb :severe
        else 
		erb :otherweather
	end
end
