require 'escper' # https://github.com/michaelfranzl/ruby-escper
require 'rqrcode_png'
require 'bitcoin' # bitcoin-ruby

require_relative 'paperbank_lib'
include PaperBankLib

require_relative 'lib/vendor/keygen'

# note: chmod 666 /dev/usb/lp0
PRINTER = '/dev/usb/lp1' # lp0 on rasp pi, on debian 7 is lp1 by default

Bitcoin.network = :litecoin # supported out of the box: :testnet (bitcoin testnet), :litecoin, :litecoin_testnet, :freicoin, :namecoin, :namecoin_testnet

class PaperBank
  def initialize
    g = KeyGenerator.new
    @key = g.get_key 0
  end

  def print_pairs
    prepare

    print_one
    sleep 6
    print_one
  end

  private

  def prepare
    template = 'main'
    @image_pub  = "templates/#{template}.png"
    @image_priv = "templates/#{template}_priv.png"

    qr = qrcode_img @key.addr
    qr.save @image_pub
  end

  def print_one
    # qr pub
    print_send 'BTC Paper Wallet'
    line
    print_send 'ADDRESS'
    print_img_send @image_pub
    # pub
    print_send format_addr @key.addr
    space
    # qr priv
    print_send "PRIVATE KEY (keep secret!):\n"
    priv = @key.to_base58 # ,priv, also there's to_bip38(passphrase) available
    qr = qrcode_img priv
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

bank = PaperBank.new
bank.print_pairs
