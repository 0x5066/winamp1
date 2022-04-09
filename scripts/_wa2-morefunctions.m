/*---------------------------------------------------
-----------------------------------------------------
Filename:	_wa2-morefunctions.m
Version:	1.0

Type:		maki/slider
Date:		30. Oct. 2012 - 23:32 
Author:		Pieter Nieuwoudt (pjn123)
E-Mail:		pjn123@outlook.com
Internet:	www.skinconsortium.com

Note:		This script adds a few more functions to Winamp modern skins.

			Takes 2 parameters:
			param="button_id;function"
			
			Functions availible:
				pledit_up
				pledit_down
			

Examples:
			<button id="playlist.up" x="-15" y="-36" w="8" h="5" relatx="1" relaty="1" rectrgn="1" tooltip="Move playing item up"/>
			<script file="scripts/_wa2-morefunctions.maki" param="playlist.up;pledit_up"/>

-----------------------------------------------------
---------------------------------------------------*/

#include <lib/std.mi>
#include <lib/pldir.mi>

Global Group myGroup;
Global Button myButton;
Global String myAction;
Global PlEdit PeListener;

System.onScriptLoaded()
{
	PeListener = new PlEdit;

	myGroup = getScriptGroup();
	myButton = myGroup.getObject(getToken(getParam(),";",0));
	myAction = strlower(getToken(getParam(),";",1));
}

myButton.onLeftClick(){
	if(myAction == "pledit_up"){
		PlEdit.moveUp (PeListener.getNumSelectedTracks()-1);
		PlEdit.showCurrentlyPlayingTrack();
	}
	else if(myAction == "pledit_down"){
		PlEdit.moveDown (PeListener.getNumSelectedTracks()+1);
		PlEdit.showCurrentlyPlayingTrack();
	}
	
}