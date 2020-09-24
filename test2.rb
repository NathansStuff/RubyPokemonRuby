
require 'RMagick'
include Magick

cat = ImageList.new("twitter.png")
cat.display
exit