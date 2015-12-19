require 'pp'
require 'optparse'
require 'json'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: gh-traffic.rb [options]"

  opts.on("-u USERNAME", "--username USERNAME", "Github username") do |u|
    @user = u
  end
  opts.on("-p PASSWORD/TOKEN", "--password PASSWORD/TOKEN", "Github password or auth token") do |p|
    @pass = p
  end
  opts.on("-o ORG", "--org ORG", "Github organization") do |o|
    @org = o
  end
  opts.on("-r REPO", "--repo REPO", "Github repo to pull traffic stats from") do |r|
    @repo = r
  end
  opts.on("-j", "--json", "Print values in JSON") do |j|
    @json = true
  end
end.parse!

unless @user 
  puts "Must provide user. Please see comannd switches with -h."
  exit 1
end

unless @pass
  puts "Must provide password/token. Please see comannd switches with -h."
  exit 1
end

unless @org 
  puts "Must provide organization. Please see comannd switches with -h."
  exit 1
end

unless @repo 
  puts "Must provide repository. Please see comannd switches with -h."
  exit 1
end

module GH
  class Session
  	include Capybara::DSL

  	attr_accessor :session

    def initialize
    	@session = Capybara::Session.new(:poltergeist)
    end

    def login(user, pass)
    	session.visit 'https://github.com/login'
  		session.fill_in 'Username or email address', :with => user
  		session.fill_in 'Password', :with => pass
  		session.click_button 'Sign in'		
    end

    def traffic_data(user, repo)
    	# we just need to set the type
    	session.driver.add_headers("Accept" => "application/json")
    	session.visit "https://github.com/#{user}/#{repo}/graphs/traffic-data"
    	data = /({.*})/.match session.body
    	return data.to_s
    end

    def traffic_data(user, repo)
    	# we just need to set the type
    	session.driver.add_headers("Accept" => "application/json")
    	session.visit "https://github.com/#{user}/#{repo}/graphs/traffic-data"
    	data = /({.*})/.match session.body
    	return data.to_s
    end

    def clone_activity_data(user, repo)
    	session.driver.add_headers("Accept" => "application/json")
    	session.visit "https://github.com/#{user}/#{repo}/graphs/traffic-data"
    	data = /({.*})/.match session.body
    	return data.to_s
    end

    def clone_activity_data(user, repo)
    	session.driver.add_headers("Accept" => "application/json")
    	session.visit "https://github.com/#{user}/#{repo}/graphs/clone-activity-data"
    	data = /({.*})/.match session.body
    	return data.to_s
    end

  end
end

g = GH::Session.new
g.login(@user, @pass)
traffic_string = g.traffic_data(@org, @repo)
clone_string = g.clone_activity_data(@org, @repo)

if @json 
  puts JSON.parse(traffic_string)
  puts JSON.parse(clone_string)
else
  traffic = JSON.parse(traffic_string)
  clone = JSON.parse(clone_string)
  pp traffic
  pp clone
end






