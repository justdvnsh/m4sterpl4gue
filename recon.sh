#!/bin/bash

reconData() {
 
  echo "[+] Starting the recon. Finding subdomains for you..."
  echo -n "[+] Please enter a domain to find -> "
  echo "[+] Starting sublist3r for $DOMAIN"
  read DOMAIN
  if [ -d "./$DOMAIN" ]
    then
      sublist3r -v -o ./$DOMAIN/subdomains.txt -d $DOMAIN 
    else
      mkdir $DOMAIN && sublist3r -v -o ./$DOMAIN/subdomains.txt -d $DOMAIN
  echo "[+] Found some subdomains for you."
  echo "[+] Now gathering some more subdomains  from amass for $DOMAIN"
  amass enum -d $DOMAIN -o ./$DOMAIN/subdomains_amass.txt
  echo "[+] Found a few more subdomains for you."
  echo "[+] You can find the subdomain list in $DOMAIN folder."
  echo "[+] Now finding some intel regarding the target."
  amass intel -d $DOMAIN -o ./$DOMAIN/intel.txt
  echo "[+] Found some intel regarding the target ."

}
