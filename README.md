# Docker for ancient Quartus versions

Needs [x11docker](https://github.com/mviereck/x11docker). Additional packages [may be required](https://github.com/mviereck/x11docker#dependencies).

### Installation

Download a Quartus tarball and put it in a folder (which will become the image's home folder), then:

```
cd <this folder>
docker build -t quartus .
x11docker --clipboard --home --homedir <image home dir> -- "--device=/dev/bus/usb/ --network none" quartus install_quartus
```

The Quartus installer should start: install it somewhere in the home folder.

Don't forget to add the udev rules (on the host) to allow Quartus access to the USB programmers; for example, this file

```
# USB-Blaster
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"

# USB-Blaster II
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"
```

put in /etc/udev/rules.d/50-usb-blaster.rules gives full access to the USB-Blaster devices to any user.
Use `udevadm control --reload` (and plug again the device if already plugged) to refresh the permissions.

### Run

```
x11docker --clipboard --home --homedir <image home dir> -- "--device=/dev/bus/usb/ --network none" quartus <install path>/quartus/bin/quartus
```

For example, with Quartus 13.0 Service Pack 1 and the default installation path:

```
x11docker --clipboard --home --homedir <image home dir> -- "--device=/dev/bus/usb/ --network none" quartus ~/altera/13.0sp1/quartus/bin/quartus
```

