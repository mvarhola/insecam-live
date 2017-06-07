#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
   

main_page = Nokogiri::HTML(open("http://www.insecam.org/en/bytype/axis/"))
max_page = main_page.css('nav.navigation')[0].text.split(",")[1].strip().to_i
#puts max_page

random_page = rand(1..max_page+1)

#puts "Looking on page #{random_page} of insecam Axis cameras."

cam_page = Nokogiri::HTML(open("http://www.insecam.org/en/bytype/Axis/?page=#{random_page}"))
possible_cams = cam_page.css('div.thumbnail-item')
cam_link = puts possible_cams[0..possible_cams.length].css('img')[0]['src']





