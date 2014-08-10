require 'escper' # https://github.com/michaelfranzl/ruby-escper
require 'rqrcode_png'
require 'bitcoin' # bitcoin-ruby

require_relative "paperbank_lib"
include PaperBankLib

# note: chmod 666 /dev/usb/lp0
PRINTER = "/dev/usb/lp1" # on debian 7 is lp1 by default, choose lp0 if you want to use it with rasp pi
# PRINTER = "/dev/usb/lp0" # rasp pi

VANITYGEN_CMD = "/home/makevoid/Sites/vanitygen/vanitygen"

class PaperBank
  def initialize(vanity_part)
    output = `#{VANITYGEN_CMD} -v 1#{vanity_part} 2>&1`

    if output.match("Address:")
      address = output.match("Address: (.+?)\n")[1]
      privkey = output.match(/Privkey \(hex\): (.+?)\n/)[1]
      # puts address, privkey
      @key = Bitcoin::Key.new privkey
    else
      puts "Vanitygen could not generate address, try running it manually"
      exit
    end

  end

  def print_once
    prepare

    print_one
  end

  def print_pairs
    prepare

    print_one
    sleep 6
    print_one
  end

  private

  def prepare
    template = "main"
    @image_pub  = "templates/#{template}.png"
    @image_priv = "templates/#{template}_priv.png"

    qr = qrcode_img @key.addr
    qr.save @image_pub
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
    # priv
    print_send priv
    line
    line
  end

  def clean
    `rm -f #{@image_pub}`
    `rm -f #{@image_priv}`
  end

end

bank = PaperBank.new ARGV[0]
# bank.print_one
bank.print_pairs