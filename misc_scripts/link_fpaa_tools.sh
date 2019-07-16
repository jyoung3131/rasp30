#!/bin/bash
#Last updated: 07/16/2019
#This script will link the RASP tools and appropriate scilab installation to your home directory.
#NOTE: Run this from your home directory!

# exit on error
set -e

link_tools() {
	ln -s /tools/neuro/fpaa/x86_64/scilab-5.4.1 scilab-5.4.1
	ln -s /tools/neuro/fpaa/x86_64/scilab-5.5.2 scilab-5.5.2
	ln -s /opt/fpaa/rasp30 rasp30
}

#If you want to unlink this software you can use the following function
unlink_tools() {
	unlink rasp30
	unlink scilab-5.4.1
	unlink scilab-5.5.2
}

link_tools
#unlink_tools
