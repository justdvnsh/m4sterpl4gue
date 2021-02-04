#!/bin/bash

check_for_programs() {
  echo "[+] Checking if the programs are installed on this machine."
  command -v "sublist3r"

  if [ "${?}" -ne 0 ] 
    then
     echo "[-] sublist3r is not installed. Installing it now \n"
     sudo apt-get install sublist3r
    else
      echo "[+] Sublist3r module is installed"
  fi
}
