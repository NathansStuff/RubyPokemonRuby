
require 'rmagick'
include Magick

puts 'started'

cat = Magick::ImageList.new("twitter.png")
# cat.display
# exit
puts 'completed'