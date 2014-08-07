# Thermal Printer + QR Codes + Bitcoin + Ruby

VANITY branch

- next step, use vanitygen fast c implementation

- right now: using ruby HDW keygen (has a very simple pure ruby implementation)

  g = KeyGenerator.new
  puts g.get_key(0)




### prerequisites

I don't know about the other OSes but

on linux it's all pretty easy

- install ruby

- install libmagick-dev and libmagickwand-dev

- gem install escper

- gem install rqrcode_png

- gem install openssl

- edit miniprint.rb

configure your printer and your receiving address:

    PRINTER = "/dev/usb/lp1"
    DATA = "1Jxvq9...pPVup"


### running


    ruby miniprint.rb


this should work on Debian out of the box!

