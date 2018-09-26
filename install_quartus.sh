#!/bin/bash

cd ~

if [ ! -f setup.sh ]; then
	if [ -z $(find . -maxdepth 1 -name "Quartus-*") ]; then
		echo "Missing Quartus install .tar!"
		exit 1
	fi

	echo "Extracting Quartus tar"
	tar -xf Quartus-*-$(find . -maxdepth 1 -name "Quartus-*" | cut -d '-' -f 3 | sort | tail -n 1)-linux.tar
	rm Quartus-*-linux.tar
fi

version=$(./setup.sh --version | cut -d ' ' -f 7)

echo "Installing Quartus $version"
./setup.sh && \
echo "Removing setup.sh and components/" && \
rm -rf setup.sh components/

read -n 1 -s -r -p "Press any key to continue"
