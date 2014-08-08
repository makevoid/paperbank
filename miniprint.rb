require 'escper' # https://github.com/michaelfranzl/ruby-escper
require 'rqrcode_png'

require_relative "miniprint_lib"
include MiniprintLib


require_relative "lib/vendor/keygen"


require 'bitcoin' # bitcoin-ruby

g = KeyGenerator.new
key = g.get_key 0

# puts key.pub      #OpenSSL::BN.from_hex(priv)
# puts key.priv

# Bitcoin::OpenSSL_EC.regenerate_key(priv)[1]

# vanitygen_cmd = "/home/makevoid/Sites/vanitygen/vanitygen"
# `#{vanitygen} 1Asd`
# parse output



# note: execute with sudo
# or sudo chmod 0666 /dev/usb/lp1

PRINTER = "/dev/usb/lp1"


DATA = key.pub  # "1Jxvq97AasVEWM26pdG5eJaoNxak7pPVup"

TEMPLATE = "main"

# main

template = TEMPLATE
image_file = "templates/#{template}.png"

qr = qrcode_img key.addr
qr.save image_file

# debug
puts key.addr
print_send key.addr
space


final

# qr pub
print_img_send image_file
space
# pub
print_send key.addr[0..20]
print_send key.addr[21..-1]
space
space
space
# qr priv
qr = qrcode_img key.priv
qr.save image_file
print_img_send image_file
space
#priv
print_send "PRIVATE KEY (keep secret):\n"
print_send key.priv
space


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


# def print_send
#   `cat templates/#{TEMPLATE}.txt > /dev/usb/lp1`
#   # `cat templates/img32.png > /dev/usb/lp1`
# end




###

# save DATA
# escper TEMPLATE

# save img
# # save qrcode DATA
# print_send


