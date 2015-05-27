# PaperBank

### Website

## [Paperbank.it](http://paperbank.it)


### Bro/Sis project

#### [BitNFC.org](http://bitnfc.org)

### Dog project ^^

#### [DogeNFC.com](http://dogenfc.com)


### Bip38 branch

using bip38 from bitcoin ruby gem to generate bip38 password protected paper wallets (private key starts with digit 6)


#### Bitcoin Paper Wallet Bank


[![](http://uploads.makevoid.com/paperbank_final.png)](https://www.youtube.com/watch?v=CUM51acMHJY)

[watch the demo on youtube](https://www.youtube.com/watch?v=CUM51acMHJY)

### Bringing together: a thermal printer + QR Codes + Bitcoin + Ruby = awesome

This repo contains **all you need** to run your bitcoin PaperBank!
PaperBank is another way to say: cold storage paper wallet printer

### What you need

- A Raspberry PI or similar mini and cheap linux box
- An USB Thermal Printer
- HDMI monitor, usb cable, usb power adapter (cellphone usb wall charger), sd card,


### It's a DIY solution, you have to follow the installation procedures to install PaperBank on your Raspberry PI


---

Affordable: All for under ~ 60 USD

#### Brief explanation:

- Cold storage: because it remains offline
- Prints Paper wallets

and:

- Cheap! You can get everything (Rasp PI + Thermal printer + sd card + cables) for 60 bucks or so
- DIY
- Secure


You can then print wallets for yourself, or paper wallets where you deposit small amounts (ex: a buck or two) for friends that want to try bitcoin!

note: It doesn't provide a real banking "feature", just the generations of accounts (address/private key pairs), you have to apply phisical security measure to those wallets!

Donate to get password encrypted wallets sooner!


### Please Donate!

#### BTC: `1PBank95kE4BZaQBfMsGZ3RCkqwwtGHjKA`

I will generate a vanity address soon.
(todo: put this text at the end of Readme.md as well)





#### other generators

I will provide other generators support in the near future such as

- vanitygen
- HDW address generation
- another non bitcoin-ruby address generation lbrary



### What you need:

- a thermal printer that works with linux

#### [the thermal printer I got](http://www.aliexpress.com/item/Barcode-scanner-and-58mm-printer-USB-mini-thermal-receipt-printer-ticket-pos-portable-laser-printers-freeshipping/1544271573.html) (40USD or less)

- [a similar thermal printer on amazon](http://www.amazon.com/Imagestore-Brainydeal-SC9-2012-High-speed-Receipt/dp/B005HH2YVY/ref=sr_1_2?ie=UTF8&qid=1407576243&sr=8-2&keywords=thermal+printer)
- [thermal printers on aliexpress](http://www.aliexpress.com/wholesale?SearchText=thermal%20printer)

#### a raspberry PI or similar cheap linux box that you can keep always offline


rasp pi links:

- [rasp pi](http://www.element14.com/community/community/raspberry-pi/raspberry-pi-bplus?ICID=rpimain-topban-BPlus)
- [cubieboard on aliexpress](http://www.aliexpress.com/wholesale?SearchText=cubieboard) (should work the same, has better specs)
- [olinuxino](https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-MICRO/open-source-hardware)


### Install on Raspberry PI

This section has been moved to:

- [Installation (Condensed)](http://paperbank.it/install/raspberry/short/)
- [Installation (Full)](http://paperbank.it/install/raspberry/)

### Install on Linux

This is a much standard install, It works on Debian and should work on ubuntu (some apt package names may change)

- [Install on Linux (Debian)](http://paperbank.it/install/linux/)

### Install on Mac OS

For users: **Coming soon**.

For "hackers" that want it now: 

Open "OSX CUPS webpage":http://localhost:631, add your usb thermal printer as Generic printer, then go into the code and change all the lines where the output is piped directly to usb (as it's possible in linux) [/dev/usb/ldX] to cups commands (you need to write contents to a file and then issue the print command passing that file as argument)


#### notes:

put something inside the the LAN hole so no-one can accidentally connect an ethernet cable, a piece of sponge will do  in most cases, a chewing gum is a bit extreme and not recommended if you want to use that ethernet port again :)

check also VANITY branch for vanity address implementations



### Donations, forks and new features!

#### **Please donate**
some milliBits so I can find time to improve this project:
#### [1PBank95kE4BZaQBfMsGZ3RCkqwwtGHjKA](https://blockchain.info/address/1PBank95kE4BZaQBfMsGZ3RCkqwwtGHjKA)

Or fork it and improve it yourself!

### Features/forks needed/expected:

#### done:

- feature: Vanity address patch - add support for vanitygen [done by @makevoid - vanitgen branch - needs integration]
- feature: integration of other currencies [by @makevoid - Litecoin is in lite branch, Dogecoin is in doge branch + explanation on how to create a fork compatible with every currency]
- feature: BIP38 password protection - password protected private key

#### todo:

- bundle: docker image
- feature: add hardware button to rasp pi via GPIO
- feature: autolaunch everything, so you don't need an hdmi screen
- dependencies: try to remove imagemagick & rmagick requirements
- dependencies: remove bitcoin-ruby requirement by extracting code from it
- speed: printing speedup (manage memory more efficiently)
- speed: lower language optimizations


The more donations, the faster the features!
Donations will be split to all the contributors, you may want to contribute starting from picking a todo above or with another idea! Forks & pull requests are very welcome.

See another project I did with some friends: [http://donacoin.com](donacoin.com) - [https://github.com/makevoid/donacoin](github.com/makevoid/donacoin) A cryptocoin mining based donation system

Another one, not bitcoin related: [http://thorrents.com](thorrents.com) - [https://github.com/makevoid/thorrents](github:makevoid/thorrents)



### small FAQ

- why Paper Wallets?

They are very useful as cold storage, and there are many undiscovered usages of having btc in "banknotes" form.

You can print small banknotes (2mBTC - 20mBTC ~ 1 - 10 euro) and give it to your friends to let them try bitcoin.

You can have paper wallets with your funds

- why a thermal printer?

The ability to create fast and cheap paper wallets it's key. The thing is

- why Rasp - pi?

It's very cheap and widespread, you can use any linux box if you like, just remember to not connect it to the internet anymore

- why Mycelium is used in the video?

You can use whichever wallet you prefer, blockchain, coinbase [insert your favourite wallet here] I found mycelium to be pretty straightforward in terms of cold storage, for maximum security you should always sign transactions offline :)

- why Ruby?

It was very fast to implement and to tinker with, you can go and rewrite it in your own favourite language.


