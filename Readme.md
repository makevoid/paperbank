# Thermal Printer + QR Codes + Bitcoin + Ruby

this branch and the VANITY branch should be used to create paper wallets with a thermal usb printer


### What you need:

- a thermal printer that works with linux

This model: 40USD or less
[insert aliexpress link here]


- a raspberry PI or similar cheap linux box that you can keep always offline

rasp pi link

cubieboard (not tested)


### Install on raspberry pi

- get a brand new sd card or do a safe format
- open LXTerminal
    
- get the code

    git clone https://github.com/makevoid/miniprint

- cd and switch branch

    cd miniprint; git branch main

- gem install escper         --no-ri --no-rdoc
- gem install rqrcode_png    --no-ri --no-rdoc


- DISCONNECT INTERNET and NEVER RECONNECT AGAIN (otherwise you lose all the benefits of the cold storage)

if you are truly paranoid you can make the above steps offline, by transferring this repo and the ruby gems via usb stick and installing them manually
    
- test the printer

  echo "\nOK MASTER\n\n\n" > templates/test.txt
  cat templates/test.txt > /dev/usb/lp0

- run

    ruby miniprint.rb


you now have a cold paper wallets machine! enjoy! 


### not required


- install rmagick dependencies [ NOT REQUIRED ]

    sudo apt-get install libmagickcore-dev libmagickwand-dev

notes: `pcmanfm .` opens the file manager into the current directory

### MAIN branch



check also VANITY branch for vanity address implementations




- maybe use ruby HDW keygen (has a very simple pure ruby implementation)

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

