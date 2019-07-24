require 'mechanize'
require 'nokogiri'
require_relative '../app/models/restaurant.rb'

mech = Mechanize.new
puts "Enter page number"
number = gets.chomp
pages = mech.get("https://www.swiggy.com/udaipur?page=#{number}")
app = Nokogiri::HTML(pages.body, 'UTF-8')
name = app.css('.nA6kb').map{ |name| name.content}.compact
cost = app.css('.nVWSi').map{ |cost| cost.content}.compact
name.each_index do |i|
  restaurant = Restaurant.find_or_initialize_by(name: name[i], cost: cost[i])
  restaurant.save!
end
