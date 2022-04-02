#include "..\..\..\lib/std.mi"

Global timer timeofday;
Global text currenttime;

System.onScriptLoaded(){
    Group about = getScriptGroup();

    currenttime = about.findObject("currenttime");

    timeofday = new Timer;
	timeofday.setDelay(50);
    timeofday.start();
}

timeofday.onTimer(){
    currenttime.setText(integerToLongTime(System.getTimeOfDay()));
}