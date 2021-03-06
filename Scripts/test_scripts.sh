#!/bin/bash
#
# This script is for testing Scripts inside this folder.
#
# Contact: pranav@aptira.com
# License: Apache Software License (ASL) 2.0 

# Ignore -- this is for decorations

RCol='\e[0m'    # Text Reset

#Regular            #Bold               #Underline          #High Intensity     #BoldHigh Intens    #Background         #High Intensity Backgrounds

Bla='\e[0;30m';     BBla='\e[1;30m';    UBla='\e[4;30m';    IBla='\e[0;90m';    BIBla='\e[1;90m';   On_Bla='\e[40m';    On_IBla='\e[0;100m';
Red='\e[0;31m';     BRed='\e[1;31m';    URed='\e[4;31m';    IRed='\e[0;91m';    BIRed='\e[1;91m';   On_Red='\e[41m';    On_IRed='\e[0;101m';
Gre='\e[0;32m';     BGre='\e[1;32m';    UGre='\e[4;32m';    IGre='\e[0;92m';    BIGre='\e[1;92m';   On_Gre='\e[42m';    On_IGre='\e[0;102m';
Yel='\e[0;33m';     BYel='\e[1;33m';    UYel='\e[4;33m';    IYel='\e[0;93m';    BIYel='\e[1;93m';   On_Yel='\e[43m';    On_IYel='\e[0;103m';
Blu='\e[0;34m';     BBlu='\e[1;34m';    UBlu='\e[4;34m';    IBlu='\e[0;94m';    BIBlu='\e[1;94m';   On_Blu='\e[44m';    On_IBlu='\e[0;104m';
Pur='\e[0;35m';     BPur='\e[1;35m';    UPur='\e[4;35m';    IPur='\e[0;95m';    BIPur='\e[1;95m';   On_Pur='\e[45m';    On_IPur='\e[0;105m';
Cya='\e[0;36m';     BCya='\e[1;36m';    UCya='\e[4;36m';    ICya='\e[0;96m';    BICya='\e[1;96m';   On_Cya='\e[46m';    On_ICya='\e[0;106m';
Whi='\e[0;37m';     BWhi='\e[1;37m';    UWhi='\e[4;37m';    IWhi='\e[0;97m';    BIWhi='\e[1;97m';   On_Whi='\e[47m';    On_IWhi='\e[0;107m';

# Ignore the above content its for decorations
echo -e "${On_Bla}"
source Keystone/Scripts/Credentials.sh
echo -e " 
    ${BIblu}Run this script from inside your Virtual Machine or test machine
    this script is meant for testing the Scripts related to OpenStack and
    not related to Virtual Box.

    The sole aim of this script is to test all of the given OpenStack Scripts
    present in the sub folder which deploys OpenStack as it is very important
    that thee scripts install and configure OpenStack properly with a touch
    of reliability otherwise one mite as well use DevStack ;).
    "

echo -e " ${BIRed}Warning!!! This may break your Operating System.
"

echo -e "${BBlu}Do you want to continue(y/N)?"
read cont

if [ "$cont" == "Y" -o "$cont" == "y" ]; then
    
    # Missing Exception Handlers :((, would have been very handy here
    echo "You Pressed Yes."
    echo -e "${BBla}Testing PreInstall"
    bash PreInstall/PreInstall.sh "single-node" > Logs/PreInstall.log

    echo -e "${BBla}Testing Keystone"
    bash Keystone/Keystone.sh > Logs/Keystone.log

    echo -e "${BBla}Testing Glance"
    bash Glance/Glance.sh > Logs/Glance.log

    echo -e "${BBla}Testing Cinder"
    bash Cinder/Cinder.sh > Logs/Cinder.log

    echo -e "${BBla}Testing Neutron"
    bash Neutron/Neutron.sh > Logs/Neutron.log

    echo -e "${BBla}Testing Nova"
    bash Nova/Nova.sh > Logs/Nova.log

    echo -e "${BBla}Testing Horizon"
    bash Horizon/Horizon.sh > Logs/Horizon.log

    echo -e "${BBla}Testing PostInstall"
    bash PostInstall/PostInstall.sh > Logs/PostInstall.log
fi
echo -e "Mostly the tests run fine ... although Im not sure !!! Please Read the Terminal Messages Carefully."
echo -e "${RCol}"
