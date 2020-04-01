require 'chunky_png'

# Creating an image from scratch, save as an interlaced PNG
png = ChunkyPNG::Image.new(200, 200, ChunkyPNG::Color::WHITE)
# png[1, 1] = ChunkyPNG::Color.rgba(10, 20, 30, 128)
# png[2, 1] = ChunkyPNG::Color('black @ 0.5')

png.circle(50, 50, 25, stroke_color=ChunkyPNG::Color::BLACK,
  fill_color=ChunkyPNG::Color.rgb(255, 0, 0))

png.save('filename.png', :interlace => true)
