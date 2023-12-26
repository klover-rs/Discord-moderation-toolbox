require 'net/http'
require 'json'
require 'dotenv'


config_file_path = 'config.json'
config_data = JSON.parse(File.read(config_file_path))

TOKEN = config_data['TOKEN']
GUILD_ID = config_data['GUILD_ID']

print "Enter the userID to ban: "
USER_ID = gets.chomp
print "Enter the reason: "
REASON = gets.chomp

API_ENDPOINT = "https://discord.com/api/v10/guilds/#{GUILD_ID}/bans/#{USER_ID}"

uri = URI.parse(API_ENDPOINT)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

headers = {
    "Authorization" => "Bot #{TOKEN}",
    "Content-Type" => "application/json"
}

data = {
    "delete_message_days" => 7,
    "reason" => REASON
}

request = Net::HTTP::Put.new(uri.request_uri, headers)
request.body = data.to_json

response = http.request(request)

puts "Response Code: #{response.code}"