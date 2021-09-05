# hamlib-web
 
 ## Projects Aim

 To provide near real-time frequency and modulation mode being used to a website, so other operators know where you are listening.
  No firewall ports should need to be opened, all data across Internet should be encrypted.
  An example site can be seen here [AI6BH](https://wavi.ng/@AI6BH).
 
![image](https://user-images.githubusercontent.com/6131216/132065570-339a274c-f3a3-4721-a197-1216d865626d.png)

Screenshot of IC-7100 and the website showing listening at 7.185Mhz LSB

![IMG_20210903_142218](https://user-images.githubusercontent.com/6131216/132066553-28544268-82c9-4ed9-ac91-151c71cc1070.jpg)

## Full Disclosure
I am part of the founding team of the wavi.ng website and the opensoure project that provides the underlying technology.
- [@Foundation](https://github.com/atsign-foundation) Open Source Project
- [@Platform](https://atsign.dev) Documentation for developers
- [@Company](https://atsign.com) Get an @sign (free or paid)

  
## How this is implemented
 The [hamlib project](https://github.com/Hamlib/Hamlib) is truly awesome and allows most rigs to be connected and controlled remotely or locally via the CAT interface that is found on most modern Ham radio rigs.

 This project builds on the hamlib and inparticular the use of `rigctld` which exposes the rigctl via TCP socket.
 A small shell script polls the rig via a TCP socket connection, if it notices a change of frequecy or modulation mode it will update the website.
 The frequency/mode is updated via the @platform using a tool called `atcli` to a particular @sign. @signs are the identifier on the @platform, mine is @AI6BH as an example.

 The wavi.ng website asks for an @sign and then processes data held within the @sign. Data in this case the frequency and mode can be updated via `atcli`, but also an IoS/Android application called @wavi.
 
 ![Untitled Diagram](https://user-images.githubusercontent.com/6131216/132076051-a04074b6-d3f9-4f43-b3f0-8366cf5363ed.jpg)

 ## Installation
### Hamlib installation and connection to rig
 First step is to connect your rig to the computer you plan to run the [hamlib project](https://github.com/Hamlib/Hamlib) tools. In my case that was as simple as a RaspberryPI and a USB Cable connected to my Icom IC-7100.
 On a modern Linux system you can either download the binaries from the hamlib project, compile them from the source code or even easier add them using the package manager on your Linux distro.
 
 On the RaspberryPi this was simply a matter of using the following commmad.
 ```
 sudo apt install libhamlib-utils
 ```

 If you have an older radio you might have to connect via USB to serial connection or perhaps just a serial connector. Whatever the case you will be able to run `rigctl` to test the connection is working as it should.

```
pi@serverlan:~ $ ls -l /dev/ttyUSB*
crw-rw---- 1 root dialout 188, 0 Sep  2 17:54 /dev/ttyUSB0
crw-rw---- 1 root dialout 188, 1 Sep  2 17:54 /dev/ttyUSB1
crw-rw---- 1 root dialout 188, 2 Sep  3 14:30 /dev/ttyUSB2
crw-rw---- 1 root dialout 188, 3 Sep  2 17:54 /dev/ttyUSB3
pi@serverlan:~ $ rigctl -m 370 -r /dev/ttyUSB2 -t 7100 -s 19200

Rig command: f
Frequency: 7185000

Rig command: m
Mode: LSB
Passband: 3000

Rig command: ^C
pi@serverlan:~ $
```

The `ls` command shows the serial ports on my RaspberryPI, ttyUSB0/1 is my FT991 and ttyUSB2/3 is my IC-7100. I know this by looking at the output of `dmesg`. The next step is to test the interface to the radio using the `rigctl` command. 

Once that is working you can now run the `rigctld` command to expose the rigctl to any other machines on your network. This is useful so you can update a website and control the rig remotely or use logging software all simultaneously. 

It is worth noting that there is no security at all on rigctld so ensure you only expose this to a known network and not the Internet as a whole.

### Getting an @sign and setting up a wavi page
Your @sign is you unique id on the @platform, it's nice to have your callsign as your @sign like I do. If you get a free @sign from [The @ Company](https://atsign.com) and you are reading this let me know directly what that free @sign is and I can add your callsign @sign to your account for FREE for a limited time.

Once you have your @sign you can activate it with any @app, my suggestion is @wavi which is available at the [App Store](https://apps.apple.com/us/app/persona/id1527182357) or [Play store](https://play.google.com/store/apps/details?id=com.atsign.at_settings). As you activate you will be asked to save your "keys". This is just a file that contains the cryptographic keys to your @sign. The keys were "cut" by your phone, so no one else has them so keep them safe. You will also need them for the next step.

Use the @wavi app to set up any information you want to share with the world. You control all the information and you can add pure HTML/JS etc to customize your page. More clues on how to do that can be found [here](https://wavi.ng/@wavi). 

### setting up the automatic updates from hamlib to your @wavi page
The first step is to download this repo on the machine you plan to run the updates from. This machine in my case is the same RaspberyPi I am running hamlib on but it does not have to be as we will be talking to the `rigctld` daemon over TCP. It does however need to be a Linux machine running on an ARMv7 (Pi3), ARMv8(Pi4) or an PC (AMD64), this is so we can build the `atcli` binary which is programmed in Dart. 
```
git clone https://github.com/cconstab/hamlib-web.git
```

We will be using Docker to build the `atcli` binary so that needs to be installed first. That is pretty simple these days, but make sure you remove the packaged Docker and reinstall if your version is lower than 19.03.01. To find the version you are using
 ```
pi@serverlan:~ $ docker --version
Docker version 20.10.8, build 3967b7d
pi@serverlan:~ $
 ```

To install docker-ce (not the distribtions version) is really easy these days.

```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo ./get-docker.sh
```

Ok once installed we are ready to compile the `atcli` command

```
cd hamlib-web
./build_atcli.sh
```
 Next move the key file you were asked to save as you activated your @sign to the key sub directory. This file contains your keys so be careful with them, but without them you cannot update the @sign data. I used Gdrive to get the file from my phone to my PC, then used WinSCP to the RaspberryPi and was careful to tidy up afterwards. If you have lost the keys, the @wavi app will allow you to export them from the safe storage on your phone.

 ```
 cp <location of keyFile> key/
 ```

Next a quick edit of the config file in the config directory a template file is in that directory as a guide.

```
cp config/config.yaml.example config/config.yaml
```

Use your favourite editor to update the config.yaml all that really is needed is the `at_sign:` and the `key_file_location:` fields.

### Start your engines
I tend to use `tmux` to see long running terminal programs so I can see if there are any errors and see the logs in realtime. In either case you need to star the two processes, first the `rigctld` to speak to the rig and `syncwavi.sh` to update your wavi page.
Lets start with rigctld.

```
while true; do rigctld -m 370 -r /dev/ttyUSB2 -t 7100 -s 19200 ; sleep 5; done
```
I put this in a loop to catch any crashes of rigctld, it is very reliable but it will crash on occasion. Next you will see the -t and the port TCP port number. This port number and the IP address of the machine running `rigctld` needs to be communicated to the `syncwavi.sh` script via an `.ENV` file.

```
cp ENV.example .ENV
vi .ENV
```

Edit the .ENV file with the right variables and then run `syncwavi.sh`. It will display the deltas and the commit IDS as it updates your @sign. 

This is mine running in [tmux](https://github.com/tmux/tmux/wiki).. Let me know how you get on!

73!

![image](https://user-images.githubusercontent.com/6131216/132072575-f0a6e8b2-a0d1-4046-9fd7-739d43b01ace.png)

