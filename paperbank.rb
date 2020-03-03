require 'bundler/setup'
Bundler.require :default

require 'io/console'

require_relative "paperbank_lib"
include PaperBankLib

puts "Insert your bip38 password:\n"
BIP_38_PASS = STDIN.noecho(&:gets).strip
puts "Insert your bip38 password again:\n"
if BIP_38_PASS != STDIN.noecho(&:gets).strip
  puts "Password mismatch, aborting"
  exit
end

# note: you may need to run "sudo chmod 666 /dev/usb/lp1" or give your account permissions on debian
PRINTER = "/dev/usb/lp0" # lp0 on rasp pi or ubuntu, on debian 7 is lp1 by default

class PaperBank
  def initialize
    g = Bitcoin::Wallet::KeyGenerator.new
    @key = g.get_key 0
  end

  def print_sequence
    prepare

    print_one

    # uncomment to print multiple copies (backups are good :D)
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
    # QR code's address (public)
    print_send "BTC Paper Wallet"
    line
    print_send "ADDRESS"
    print_img_send @image_pub
    # address (public)
    print_send format_addr @key.addr
    space

    # Private key QR
    print_send "PRIVATE KEY (keep secret!):\n"
    priv = @key.to_bip38 BIP_38_PASS
    qr = qrcode_img  priv
    qr.save @image_priv
    print_img_send @image_priv
    # Private key text
    print_send priv
    line
    line

    # Howto
    print_send "To use this wallet:"
    print_send "- Download 'Mycelium'"
    print_send "  - Select 'Cold storage' from the prefs menu"
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


# main:

bank = PaperBank.new
bank.print_sequence
