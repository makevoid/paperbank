# PaperBank

#### Bitcoin Paper Wallet Bank

[video]

### Bringing together: a thermal printer + QR Codes + Bitcoin + Ruby = awesome

This repo contains **all you need** to run your bitcoin PaperBank!
PaperBank is another way to say: cold storage paper wallet printer

#### Brief explanation:

- Cold storage: because it remains offline
- Prints Paper wallets

and:

- Cheap! You can get everything (Rasp PI + Thermal printer + sd card + cables) for 60 bucks or so
- DIY
- Secure


You can then print wallets for yourself, or paper wallets where you deposit small amounts (ex: a buck or two) for friends that want to try bitcoin!


### Please Donate!

#### BTC: `1EiNgZmQsFN4rJLZJWt93quMEz3X82FJd2`

I will generate a vanity address soon.
(todo: put this text at the end of Readme.md as well)


### What you need:

- a thermal printer that works with linux

#### [the thermal printer I got](http://www.aliexpress.com/item/Barcode-scanner-and-58mm-printer-USB-mini-thermal-receipt-printer-ticket-pos-portable-laser-printers-freeshipping/1544271573.html) (40USD or less)

- [a similar thermal printer on amazon](http://www.amazon.com/Imagestore-Brainydeal-SC9-2012-High-speed-Receipt/dp/B005HH2YVY/ref=sr_1_2?ie=UTF8&qid=1407576243&sr=8-2&keywords=thermal+printer)

- [thermals printers on aliexpress](http://www.aliexpress.com/wholesale?SearchText=thermal%20printer)
 

#### a raspberry PI or similar cheap linux box that you can keep always offline


rasp pi links:

- [rasp pi](http://www.element14.com/community/community/raspberry-pi/raspberry-pi-bplus?ICID=rpimain-topban-BPlus)
- [cubieboard on aliexpress](http://www.aliexpress.com/wholesale?SearchText=cubieboard) (should work the same, has better specs)
- [olinuxino](https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-MICRO/open-source-hardware)


### Install on raspberry pi

- get a brand new sd card or do a safe format
- get NOOBS release from raspbian official website! (check the sha) and copy it to the sd
- install raspbian and run it

- after install, open LXTerminal
    
- install ssl-dev
 
    `sudo apt-get install libssl-dev -y`
    
- install ruby development files

    `sudo apt-get install ruby1.9.1-dev -y`

- install rmagick dependencies 

    `sudo apt-get install libmagickcore-dev libmagickwand-dev -y`
    
- get the code

    `git clone https://github.com/makevoid/paperbank`


- install ruby gems

```
sudo gem install escper         --no-ri --no-rdoc
sudo gem install rqrcode_png    --no-ri --no-rdoc
sudo gem install bitcoin-ruby   --no-ri --no-rdoc
sudo gem install ffi            --no-ri --no-rdoc
```


if you are truly paranoid you can make the above steps offline, by transferring this repo and the ruby gems via usb stick and installing them manually

- change

    `sudo chmod 0666 /dev/usb/lp0`

- test the printer

```
echo "\nOK MASTER\n\n\n" > templates/test.txt
cat templates/test.txt > /dev/usb/lp0
```

- run

    `ruby miniprint.rb`
    

on raspberry the printing is very slow! I will speed that up in the future!

- throw away the key you just created (you should have two copies)
    
- DISCONNECT INTERNET and NEVER RECONNECT AGAIN (otherwise you lose all the benefits of the cold storage)


you now have a cold paper wallets machine! enjoy! 




#### notes:

put something inside the the LAN hole so no-one can accidentally connect an ethernet cable, a piece of sponge will do  in most cases, a chewing gum is a bit extreme and not recommended if you want to use that ethernet port again :)

check also VANITY branch for vanity address implementations



### Donations, forks and new features!

#### **Please donate** 
some milliBits so I can find time to improve this project: 
#### `1EiNgZmQsFN4rJLZJWt93quMEz3X82FJd2` 

Or fork it and improve it yourself!

Features/forks needed/expected:

- feature: Vanity address patch - add support for vanitygen
- feature: passphrase patch - support password protected private key
- feature: add hardware button to rasp pi via GPIO
- feature: autolaunch everything, so you don't need an hdmi screen
- speed: printing speedup (manage memory more efficiently)
- speed: lower language optimizations

