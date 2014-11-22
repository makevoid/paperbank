if defined?(Bundler)
  require 'bundler/setup'
  Bundler.require :default
else
  require 'escper'  # https://github.com/michaelfranzl/ruby-escper
  require 'rqrcode_png'
  require 'bitcoin' # bitcoin-ruby
end

require 'io/console'

require_relative "paperbank_lib"
include PaperBankLib

# require_relative "lib/vendor/keygen"

puts "Insert your bip38 password:\n"
BIP_38_PASS = STDIN.noecho(&:gets).strip
puts "Insert your bip38 password again:\n"
if BIP_38_PASS != STDIN.noecho(&:gets).strip
  puts "Password mismatch, aborting"
  exit
end

# note: sudo chmod 666 /dev/usb/lp1
PRINTER = "/dev/usb/lp1" # lp0 on rasp pi, on debian 7 is lp1 by default


class PaperBank
  def initialize
    g = Bitcoin::Wallet::KeyGenerator.new
    @key = g.get_key 0
    # raise @key.to_bip38(BIP_38_PASS).inspect
  end

  def print_sequence
    prepare

    print_one
    sleep 6
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
    priv = @key.to_bip38 BIP_38_PASS # ,priv, also there's to_bip38(passphrase) available
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


# main

bank = PaperBank.new
bank.print_sequence
