#!/bin/bash
# Veles Core Masternode installation launcher (2nd gen, experimental)
# Starts an installation process of the Veles Core Masternode

if [[ "${1}" == "--help" ]]; then
	echo "
Veles Core Masternode installation launcher (2nd gen, experimental)
 ____   ____     .__                _________                       
_\___\_/___/____ |  |   ____   _____\_   ___ \  ___________   ____  
\___________/__ \|  | _/ __ \ /  ___/    \  \/ /  _ \_  __ \_/ __ \ 
   \  Y  /\  ___/|  |_\  ___/ \___ \\     \___(  <_> )  | \/\  ___/ 
    \___/  \___  >____/\___  >____  >\______  /\____/|__|    \___  >
               \/          \/     \/        \/                   \/ 

Usage:  install.sh [options]
Starts an installation process of the Veles Core Masternode

Options:
  --non-interactive         perform fully automatic installation
  --docker-test             install from docker and run all tests
"
  exit 0;
fi

echo -e "Preparing Veles Masternode installation ...\n"
echo -n "* Checking whether make command is present ... "

if command -v make >/dev/null 2>&1; then
  echo "yes"
else
  echo "no"
  apt-get update
  apt-get install -yq make
fi

PWD=$(pwd)
cd $(dirname $0)

if [[ "${1}" == "--non-interactive" ]]; then
  make auto_install
elif [[ "${1}" == "--docker-test" ]]; then
  make docker_test_all
else
  make install
fi

cd $PWD
