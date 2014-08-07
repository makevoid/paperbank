# Thermal Printer + QR Codes + Bitcoin + Ruby

### prerequisites

I don't know about the other OSes but

on linux it's all pretty easy

- install ruby

- install libmagick-dev and libmagickwand-dev

- gem install escper

- gem install rqrcode_png

- edit miniprint.rb

configure your printer and your receiving address:

    PRINTER = "/dev/usb/lp1"
    DATA = "1Jxvq9...pPVup"


### running


    ruby miniprint.rb


this should work on Debian out of the box!

