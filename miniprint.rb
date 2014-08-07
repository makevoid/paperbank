# note: execute with sudo
# or sudo chmod 0666 /dev/usb/lp1

DATA = "1Jxvq97AasVEWM26pdG5eJaoNxak7pPVup"
TEMPLATE = "main"


def qrcode_img(string)
  require 'rqrcode_png'
  qr = RQRCode::QRCode.new(string, size: 4, level: :h )
  png = qr.to_img                                             # returns an instance of ChunkyPNG
  png.resize 350, 350
end

def print_send
  `cat templates/#{TEMPLATE}.txt > /dev/usb/lp1`
  # `cat templates/img32.png > /dev/usb/lp1`
end

def print_img_send(path)
  # https://github.com/michaelfranzl/ruby-escper
  require 'escper'
  Escper::Img.new(path, :file).to_s
end

def debug(file)
  `nautilus #{file}`
end

template = TEMPLATE
image_file = "templates/#{template}.png"

qr = qrcode_img DATA
qr.save image_file

# debug image_file
print_img_send image_file








###

# old code

# printer spec: 32 chars per line of default text

# def save(string)
#   File.open "templates/#{TEMPLATE}.txt", "w" do |file|
#     file.write string
#   end
# end

# def qrcode(string)
#   require 'rqrcode'
#   qr = RQRCode::QRCode.new string
#   qr.to_s.gsub /x/, "x"
# end

# def qrcode_img_manual(string)
#   @qr.modules.each_index do |x|
#     @qr.modules.each_index do |y|
#       @qr.dark?(x,y)
#         "black"
#       else
#         "white"
#     end
#   end
# end




###

# save DATA
# escper TEMPLATE

# save img
# # save qrcode DATA
# print_send


