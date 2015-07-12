require 'bundler/setup'
Bundler.require :default

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
PRINTER = "/dev/usb/lp0" # lp0 on rasp pi or ubuntu, on debian 7 is lp1 by default


class PaperBank
  def initialize
    g = Bitcoin::Wallet::KeyGenerator.new
    @key = g.get_key 0
    # raise @key.to_bip38(BIP_38_PASS).inspect
  end

  def print_sequence
    prepare

    print_one
    # sleep 6
    # print_one
    # sleep 6
    # print_one
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
    # howto
    print_send "To use this wallet:"
    print_send "- for Android:"
    print_send "  - Download 'Mycelium'"
    print_send "  - Select 'Cold storage' from the prefs menu"
    print_send "- for iOS:"
    print_send "  - Download 'BreadWallet'"
    print_send "- Select 'Scan QR Code'"
    print_send "- Scan the Private Key"
    print_send "- Enter the password"
    print_send "- Yay! You should have the funds in your wallet now."
    space
    space
  end

  def clean
    `rm -f #{@image_pub}`
    `rm -f #{@image_priv}`
  end

end
