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

### Run

```
x11docker --clipboard --home --homedir <image home dir> -- "--device=/dev/bus/usb/ --network none" quartus <install path>/quartus/bin/quartus
```

For example, with Quartus 13.0 Service Pack 1 and the default installation path:

```
x11docker --clipboard --home --homedir <image home dir> -- "--device=/dev/bus/usb/ --network none" quartus ~/altera/13.0sp1/quartus/bin/quartus
```

