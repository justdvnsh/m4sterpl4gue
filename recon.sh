#!/bin/bash

recon() {
  echo "[+] Starting the recon. Finding subdomains for you..."
  echo -n "[+] Please enter a domain to find -> "
  read DOMAIN
  mkdir $DOMAIN && sublist3r -v -o ./$DOMAIN/subdomains.txt -d $DOMAIN 
  echo "[+] Found some subdomains for you."
}
