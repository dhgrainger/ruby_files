require 'JSON'
require 'pry'
require 'shotgun'
require 'net/http'

get 'states/:state/' do 
	source = "jobs.github.com/positions.json?description"
	resp = Net::HTTP.get_response(URI.parse(source))
	dte =resp.body
	@jobs = JSON.parse(data)

	@jobs = @jobs.select do |job|
		job["location"] =~ /#{params[:state]}\z/
	end

	erb :jobs
end

