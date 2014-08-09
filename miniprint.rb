require 'escper' # https://github.com/michaelfranzl/ruby-escper
require 'rqrcode_png'

require_relative "miniprint_lib"
include MiniprintLib


require_relative "lib/vendor/keygen"


require 'bitcoin' # bitcoin-ruby

g = KeyGenerator.new
@key = g.get_key 0

# puts key.pub      #OpenSSL::BN.from_hex(priv)
# puts key.priv

# Bitcoin::OpenSSL_EC.regenerate_key(priv)[1]

# vanitygen_cmd = "/home/makevoid/Sites/vanitygen/vanitygen"
# `#{vanitygen} 1Asd`
# parse output



# note: execute with sudo
# or sudo chmod 0666 /dev/usb/lp1

PRINTER = "/dev/usb/lp1"



TEMPLATE = "main"

# main

template = TEMPLATE
@image_pub  = "templates/#{template}.png"
@image_priv = "templates/#{template}_priv.png"

qr = qrcode_img @key.addr
qr.save @image_pub

# debug
# puts key.addr
# print_send key.addr
# space

def format_addr(addr)
  spaces = 3
  addr_fmt = addr.split("").each_slice(4).with_index.map do |a, idx|
    ret = ""
    ret = "\n#{" "*(spaces+2)}" if idx == 4
    a.join("") + ret
  end.join(" ")
  "#{" "*spaces}#{addr_fmt}"
end


def print_one
  # qr pub
  print_send "BTC Paper Wallet"
  line
  print_send "ADDRESS"
  print_img_send @image_pub
  # pub
  print_send format_addr @key.addr
  space
  # qr priv
  print_send "PRIVATE KEY (keep secret!):\n"
  priv = @key.to_base58 # ,priv, also there's to_bip38(passphrase) available
  qr = qrcode_img  priv
  qr.save @image_priv
  print_img_send @image_priv
  #priv
  print_send priv
  line
  line
end


### final

print_one
sleep 6
print_one

# todo: use tempfiles ffs
`rm -f #{@image_pub}`
`rm -f #{@image_priv}`

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


