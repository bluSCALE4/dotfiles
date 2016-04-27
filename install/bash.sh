#!/bin/bash

# install bash
brew install bash
if ! grep -Fxq "/usr/local/bin/bash" /etc/shells; then 
	echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
fi
