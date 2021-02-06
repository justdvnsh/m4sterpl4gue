#!/bin/bash

PROGRAMS_TO_CHECK_FOR=("sublist3r" "amass" "masscan" "nmap" "eyewitness" "python3")

GOLANG_MODULES_TO_INSTALL=("github.com/tomnomnom/assetfinder" 
                                 "github.com/lc/gau" 
                                 "github.com/theblackturtle/wildcheck" 
                                 "github.com/tomnomnom/httprobe" 
                                 "github.com/hakluke/hakrawler" 
                                 "github.com/tomnomnom/qsreplace" 
                                 "github.com/hahwul/dalfox")

check_for_programs() {
  echo "[+] Checking if the programs are installed"  
  for program in ${PROGRAMS_TO_CHECK_FOR[*]}
    do
      echo "[+] Checking if  ${program} is installed on this machine."
      command -v "${program}"

      if [ "${?}" -ne 0 ] 
        then
          echo "[-] ${program} is not installed. Installing it now \n"
          sudo apt-get install ${program}
        else
          echo "[+] ${program} module is installed"
      fi
  done
  
  echo "[+] Checking if Go has been added to your path !"
  echo $GOPATH

  if [ "${?}" -ne 0 ]
    then
      echo "[-] Golang is not added to your path. Wait...."
      echo "export GOPATH=$HOME/go" >> ~/.bashrc
      echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin"
      echo "[+] Added path."
    else
      echo "[+] Go is already added in your path !"
  fi

  echo "[+] Now installing other go and python packages"
  
  for modules in ${GOLANG_MODULES_TO_INSTALL[*]}
    do
      echo "[+] Installing -> ${modules}"
      #sudo -E go get -u ${modules}
      echo "[+] Installed -> ${modules}"
  done
}
