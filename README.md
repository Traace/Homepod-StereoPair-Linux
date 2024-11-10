# Homepod-StereoPair-Linux
Detects Homepod based on named L-R in current network and creates a stereo sink using pactl to use in music / video applications. Tested on Arch Linux.

#### Dependencies:
- You need PipeWire (with PulseAudio support) loaded
- You need to load module-raop-discover before using this script
- You need to have running avahi daemon before using this script
- The Homepod pair must be named “Homepod L” and “Homepod R”. Or just change the name in the script.
---
#### How to load module-raop-discover
To load module-raop-discover:
```pactl load-module module-raop-discover```

Or load it everytime on boot:
```/etc/pipewire/pipewire.conf.d/raop-discover.conf (or ~/.config/pipewire/pipewire.conf.d/raop-discover.conf)```
```
context.modules = [
   {
       name = libpipewire-module-raop-discover
       args = { }
   }
]
```
---
#### How to run Avahi Daemon
To run Avahi Daemon:
```systemctl start avahi-daemon```

Or run it evertime on boot:
```systemctl enable --now avahi-daemon```
