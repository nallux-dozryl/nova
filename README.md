### Nova

A tool for creating Urbit docker containers easily

### How To Use

1. Make sure you have docker installed
2. Enter sudo mode (only required if you need to be a root user to do docker stuff)
3. Copy all your planet keyfiles into the `install` directory
4. ./boot.sh
5. The keys of booted planets will then be moved into the `done` directory

_**Note:** if the boot fails, there currently isn't a way to automatically remove the volumes and containers created. I'll probably add this in the future_

### Some Additional Information

The way this script works is that it spawns the first planet with the ports hardcoded in `boot.sh` and loops through each keyfile incrementing the ports by 1. This means that you currently have to manually keep track of the ports being used by the spawned planets. This is not ideal and will be worked on to be dynamic.

### To-do

1. Make it less shitty
2. Automatically remove containers and volumes should the boot process fail for a specific keyfile/planet.
3. Un-hardcode the initial ports when running the script

### Future Plans (might change so don't expect anything from this list)

1. Frontend for managing ships as a hosting provider
2. More commands through the http api. The scripts provided with the docker image is insufficient for any serious ship management
3. Rewrite the Urbit docker image to add more functionality

### Issues

Please do not post it on Github. I'm a Github noob. Direct all your complaints to our Public Urbit Group ~donpub-datdux/gerhana-network

### Disclaimer

Everything you see here is provided as is. Feel free to do anything you want with the code written in this repo.
