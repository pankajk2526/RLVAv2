#!/bin/bash

# Requirements:
# sudo apt install jq xdotool ffmpeg

CLIP_FILE=clipfile.txt;										#File used to store changing string values within conditional and loop statements
COUNTER_FILE=counter.txt;									#File used to store status of command execution (0 for Failure, 1 for Success & 2 for Welcome)
PREVCLIP_FILE=prevclip.txt

while /bin/true; do											#Infinite loop
sleep 2;
x="";														#Resetting variables to process next string
wd="";

prevclip=$(cat $PREVCLIP_FILE)
origclip=$(curl -s --header 'Access-Token: o.JRM3Ersshl0fQfaipUzfM6QWjmgDydQx' --data-urlencode active="true" --data-urlencode limit="1" --get https://api.pushbullet.com/v2/pushes | jq '.pushes[0].body')
origclip=${origclip,,}										#Converting string to lower case
echo 0 > $COUNTER_FILE;										#Setting Status as 0 which if persist whill signify failure of command execution

if [[ $origclip != "" && $origclip != $prevclip ]]; then						#Prevent same command from running multiple times
for wd in $origclip; do										#Checking string word by word

clipboard=$x$wd;

# Opening Commands

	if [[ "$clipboard" == *open*document* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/Documents;
	clipboard=${clipboard/*document/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *document*open* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/Documents;
	clipboard=${clipboard/*open/};							#This line is different from previous conditional statement allowing more natural coversation as commands
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *open*download* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/Downloads;
	clipboard=${clipboard/*download/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *download*open* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/Downloads;
	clipboard=${clipboard/*open/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *open*picture* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/Pictures;
	clipboard=${clipboard/*picture/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *picture*open* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/Pictures;
	clipboard=${clipboard/*open/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *open*home* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/;
	clipboard=${clipboard/*home/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *home*open* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/;
	clipboard=${clipboard/*open/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *open*root* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open /;
	clipboard=${clipboard/*root/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *root*open* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open /;
	clipboard=${clipboard/*open/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *open*video* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/Videos;
	clipboard=${clipboard/*video/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *video*open* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/Videos;
	clipboard=${clipboard/*open/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *play*news* ]];
	then
	echo 1 > $COUNTER_FILE;
	sensible-browser 'https://tunein.com/radio/NDTV-24X7-s151565/';
	clipboard=${clipboard/*news/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *news*play* ]];
	then
	echo 1 > $COUNTER_FILE;
	sensible-browser 'https://tunein.com/radio/NDTV-24X7-s151565/';
	clipboard=${clipboard/*play/};
	echo $clipboard > $CLIP_FILE;
	fi &
	
	if [[ "$clipboard" == *open*browser* ]];
	then
	echo 1 > $COUNTER_FILE;
	sensible-browser;
	clipboard=${clipboard/*browser/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *browser*open* ]];
	then
	echo 1 > $COUNTER_FILE;
	sensible-browser;
	clipboard=${clipboard/*open/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *open*facebook* ]];
	then
	echo 1 > $COUNTER_FILE;
	sensible-browser 'https://www.facebook.com/';
	clipboard=${clipboard/*facebook/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *facebook*open* ]];
	then
	echo 1 > $COUNTER_FILE;
	sensible-browser 'https://www.facebook.com/';
	clipboard=${clipboard/*open/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *open*inst*gram* ]];
	then
	echo 1 > $COUNTER_FILE;
	sensible-browser 'https://www.instagram.com/';
	clipboard=${clipboard/*gram/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *inst*gram*open* ]];
	then
	echo 1 > $COUNTER_FILE;
	sensible-browser 'https://www.instagram.com/';
	clipboard=${clipboard/*open/};
	echo $clipboard > $CLIP_FILE;
	fi &

# Run Programs Commands

        if [[ "$clipboard" == *task*manager* ]];
	then
	echo 1 > $COUNTER_FILE;
	gnome-system-monitor;
	clipboard=${clipboard/*manager/};
	echo $clipboard > $CLIP_FILE;
	fi &

        if [[ "$clipboard" == *calculator* ]];
	then
	echo 1 > $COUNTER_FILE;
	gnome-calculator;
	clipboard=${clipboard/*open/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *text*editor* ]];
	then
	echo 1 > $COUNTER_FILE;
	subl;
	if [ $? != 0 ];
	then
	gnome-text-editor;
	fi &
	clipboard=${clipboard/*editor/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *open*terminal* ]];
	then
	echo 1 > $COUNTER_FILE;
	gnome-terminal;
	clipboard=${clipboard/*terminal/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *terminal*open* ]]||[[ "$clipboard" == *shell*open* ]];
	then
	echo 1 > $COUNTER_FILE;
	gnome-terminal;
	clipboard=${clipboard/*open/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *open*shell* ]];
	then
	echo 1 > $COUNTER_FILE;
	gnome-terminal;
	clipboard=${clipboard/*shell/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *start*menu* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+a;
	clipboard=${clipboard/*menu/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *show*overview* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+s;
	clipboard=${clipboard/*overview/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *overview*show* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+s;
	clipboard=${clipboard/*show/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *show*notification* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+v;
	clipboard=${clipboard/*notification/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *notification*show* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+v;
	clipboard=${clipboard/*show/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *run*command* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key alt+F2;
	clipboard=${clipboard/*command/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *command*run* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key alt+F2;
	clipboard=${clipboard/*run/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *lock*screen* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+l;
	clipboard=${clipboard/*screen/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *screen*lock* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+l;
	clipboard=${clipboard/*lock/};
	echo $clipboard > $CLIP_FILE;
	fi &

# Window Management Commands

	if [[ "$clipboard" == *refresh* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key F5;
	clipboard=${clipboard/*refresh/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *select*all* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+a;
	clipboard=${clipboard/*all/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *move*left* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+Left;
	clipboard=${clipboard/*left/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *move*right* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+Right;
	clipboard=${clipboard/*right/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *move*window* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key alt+F7;
	clipboard=${clipboard/*window/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *go*back* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key alt+Left;
	clipboard=${clipboard/*back/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *go*forward* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key alt+Right;
	clipboard=${clipboard/*forward/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *page*up* ]]||[[ "$clipboard" == *scroll*up* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key Page_Up;
	clipboard=${clipboard/*up/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *page*down* ]]||[[ "$clipboard" == *scroll*down* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key Page_Down;
	clipboard=${clipboard/*down/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *minimi* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+Down;
	clipboard=${clipboard/*minimi/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *maximi* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+Up;
	clipboard=${clipboard/*maximi/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *zoom*in* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+plus;
	clipboard=${clipboard/*in/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *zoom*out* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+minus;
	clipboard=${clipboard/*out/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *zoom*default* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+0;
	clipboard=${clipboard/*default/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *new*tab* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+t;
	clipboard=${clipboard/*tab/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *new*window* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+n;
	clipboard=${clipboard/*window/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *next*tab* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+Tab;
	clipboard=${clipboard/*tab/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *previous*tab* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key shift+ctrl+Tab;
	clipboard=${clipboard/*tab/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *next*window* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key alt+Tab;
	clipboard=${clipboard/*window/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *previous*window* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key shift+alt+Tab;
	clipboard=${clipboard/*window/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *next*workspace* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+Page_Down;
	clipboard=${clipboard/*workspace/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *previous*workspace* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key super+Page_Up;
	clipboard=${clipboard/*workspace/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *clos*current*tab* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+w;
	clipboard=${clipboard/*tab/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *current*tab*clos* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+w;
	clipboard=${clipboard/*clos/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *current*window*clos* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+w;
	clipboard=${clipboard/*clos/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *clos*current*window* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+w;
	clipboard=${clipboard/*window/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *clos* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key alt+F4;
	clipboard=${clipboard/*clos/};
	echo $clipboard > $CLIP_FILE;
	fi &

# Miscellaneous

	if [[ "$clipboard" == *increas*volume* ]]||[[ "$clipboard" == *enhanc*volume* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 15%+;
	pactl set-sink-volume 0 +15%;
	clipboard=${clipboard/*volume/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *volume*increas* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 15%+;
	pactl set-sink-volume 0 +15%;
	clipboard=${clipboard/*increas/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *volume*enhanc* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 15%+;
	pactl set-sink-volume 0 +15%;
	clipboard=${clipboard/*enhanc/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *decreas*volume* ]]||[[ "$clipboard" == *reduc*volume* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 15%-;
	pactl set-sink-volume 0 -15%;
	clipboard=${clipboard/*volume/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *volume*decreas* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 15%-;
	pactl set-sink-volume 0 -15%;
	clipboard=${clipboard/*decreas/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *volume*reduc* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 15%-;
	pactl set-sink-volume 0 -15%;
	clipboard=${clipboard/*reduc/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *volume*100* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 100%;
	pactl set-sink-volume 0 100%;
	clipboard=${clipboard/*100/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *volume*hundred* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 100%;
	pactl set-sink-volume 0 100%;
	clipboard=${clipboard/*hundred/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *100*volume* ]]||[[ "$clipboard" == *hundred*volume* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 100%;
	pactl set-sink-volume 0 100%;
	clipboard=${clipboard/*volume/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *volume*full* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 140%;
	pactl set-sink-volume 0 140%;
	clipboard=${clipboard/*full/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *full*volume* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 140%;
	pactl set-sink-volume 0 140%;
	clipboard=${clipboard/*volume/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *mute* ]];
	then
	echo 1 > $COUNTER_FILE;
	amixer set Master 0;
	pactl set-sink-volume 0 0;
	clipboard=${clipboard/*volume/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$clipboard" == *next*music* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key XF86AudioNext;
	clipboard=${clipboard/*music/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *music*next* ]]||[[ "$clipboard" == *play*next* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key XF86AudioNext;
	clipboard=${clipboard/*next/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *next*play* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key XF86AudioNext;
	clipboard=${clipboard/*play/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *previous*music* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key XF86AudioPrev;
	clipboard=${clipboard/*music/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *music*previous* ]]||[[ "$clipboard" == *play*previous* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key XF86AudioPrev;
	clipboard=${clipboard/*previous/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *previous*play* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key XF86AudioPrev;
	clipboard=${clipboard/*play/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *play*music* ]]||[[ "$clipboard" == *paus*music* ]]||[[ "$clipboard" == *stop*music* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key XF86AudioPlay;
	clipboard=${clipboard/*music/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *music*play* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key XF86AudioPlay;
	clipboard=${clipboard/*play/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *music*paus* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key XF86AudioPlay;
	clipboard=${clipboard/*paus/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *music*stop* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key XF86AudioPlay;
	clipboard=${clipboard/*stop/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *open*music* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/Music;
	clipboard=${clipboard/*music/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *music*open* ]];
	then
	echo 1 > $COUNTER_FILE;
	xdg-open ~/Music;
	clipboard=${clipboard/*open/};
	echo $clipboard > $CLIP_FILE;
	fi &

# Long Scripts

	if [[ "$clipboard" == *clean*computer* ]];
	then
	echo 1 > $COUNTER_FILE;
	echo "QSLXmm,<01" | sudo -S apt-get autoremove --purge -y &
	echo "QSLXmm,<01" | sudo -S apt-get autoclean &
	echo "QSLXmm,<01" | sudo -S apt-get clean all &
	clipboard=${clipboard/*computer/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *computer*clean* ]]||[[ "$clipboard" == *system*clean* ]];
	then
	echo 1 > $COUNTER_FILE;
	echo "QSLXmm,<01" | sudo -S apt-get autoremove --purge -y &
	echo "QSLXmm,<01" | sudo -S apt-get autoclean &
	echo "QSLXmm,<01" | sudo -S apt-get clean all &
	clipboard=${clipboard/*clean/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *clean*system* ]]||[[ "$clipboard" == *clean*system* ]];
	then
	echo 1 > $COUNTER_FILE;
	echo "QSLXmm,<01" | sudo -S apt-get autoremove --purge -y &
	echo "QSLXmm,<01" | sudo -S apt-get autoclean &
	echo "QSLXmm,<01" | sudo -S apt-get clean all &
	clipboard=${clipboard/*system/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *system*clean* ]];
	then
	echo 1 > $COUNTER_FILE;
	echo "QSLXmm,<01" | sudo -S apt-get autoremove --purge -y &
	echo "QSLXmm,<01" | sudo -S apt-get autoclean &
	echo "QSLXmm,<01" | sudo -S apt-get clean all &
	clipboard=${clipboard/*clean/};
	echo $clipboard > $CLIP_FILE;
	fi &

# More Commands

	if [[ "$clipboard" == *current*screenshot* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key alt+Print;
	clipboard=${clipboard/*shot/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *screenshot*current* ]]||[[ "$clipboard" == *captur*current* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key alt+Print;
	clipboard=${clipboard/*current/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *current*captur* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key alt+Print;
	clipboard=${clipboard/*captur/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *screen*shot* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key Print;
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *captur*screen* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key Print;
	clipboard=${clipboard/*screen/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *screen*captur* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key Print;
	clipboard=${clipboard/*captur/};
	echo $clipboard > $CLIP_FILE;
	elif [[ "$clipboard" == *print* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+p;
	clipboard=${clipboard/*print/};
	echo $clipboard > $CLIP_FILE;
	fi &

if [ "$(head -c 1 $COUNTER_FILE)" == "0" ]
then
echo $clipboard > $CLIP_FILE								#Even if string doesn't contain any command, add it to clipfile for further processing in loop
fi
x=$(cat "$CLIP_FILE")										#Variable updated with new value to used for further processing in loop

done														#For loop ends here

echo $origclip > $PREVCLIP_FILE

# Substring Using Commands

	if [[ "$clipboard" == *find* ]];
	then
	echo 1 > $COUNTER_FILE;
	sleep 2;xdotool key ctrl+f;
	clipboard=${clipboard/*find/};
	echo $clipboard > $CLIP_FILE;
	fi &

	if [[ "$origclip" == *google*search* ]];
	then
	echo 1 > $COUNTER_FILE;
	substring=${origclip/*search/};
	sensible-browser "https://www.google.com/search?q=$substring";
	elif [[ "$origclip" == *search*google* ]];
	then
	echo 1 > $COUNTER_FILE;
	substring=${origclip/*google/};
	sensible-browser "https://www.google.com/search?q=$substring";
	elif [[ "$origclip" == *google* ]];
	then
	echo 1 > $COUNTER_FILE;
	sensible-browser 'https://www.google.com/';
	fi &

	if [[ "$origclip" == *search*you*ube* ]];
	then
	echo 1 > $COUNTER_FILE;
	substring=${origclip/*you*ube/};
	sensible-browser "https://www.youtube.com/results?search_query=$substring";
	elif [[ "$origclip" == *you*ube*search* ]];
	then
	echo 1 > $COUNTER_FILE;
	substring=${origclip/*search/};
	sensible-browser "https://www.youtube.com/results?search_query=$substring";
	elif [[ "$origclip" == *you*ube* ]];
	then
	echo 1 > $COUNTER_FILE;
	sensible-browser 'https://www.youtube.com/';
	fi &

# Type Command

	if [[ $origclip == *type* ]];
	then
	echo 1 > $COUNTER_FILE;
	substring=${origclip/*type/};
	sleep 2;xdotool type "$substring";
	fi &

prevclip=$origclip;											#Variable updated with new value to prevent running same command again

# Notify Command Status

count=$(head -c 1 $COUNTER_FILE);							#Reading first character of counter file to check status of command execution
if [ $count == '1' ];
then
zenity --notification --timeout=3 --text "Success: $origclip";			#Notify successful command execution
echo 0 > $COUNTER_FILE;
else
zenity --notification --timeout=3 --text "Failure: $origclip";			#Notify failed command execution
echo 0 > $COUNTER_FILE;
fi &

fi															#If condition ends here
done														#While loop ends here
