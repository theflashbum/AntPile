Hello,

Welcome to my Flash TDD Project Template. I will be adding instructions here on 
how to use this file but for now just copy build.template.properties to
build.properties, point FLEX_HOME to where you keep your Flex 4.0 SDK lives on
your computer, run the build file then sit back and enjoy the show.

What is going on?

This build will run the unit tests.

If the test fails it will attempt to open up the report in the web browser you
specify in the build.properties file (may only work on the mac right now).

If the test passes you will not see the report. A bin folder will be created,
based on the files in build/bin-resrouces (where you keep external files for
your project) and build/html-template (the html template file in it's property
file).

Once the bin folder is setup, the browser will attempt to launch the index.html 
file and let you preview your swf.

Notes for split up version:
The build script is split up into several files which are connected by the
build.xml in the project root.  All of the parts live in build/build-imports;
they are modules that accomplish specific parts of the build.  These modules
are included into the main file, which provides a bunch of exposed targets for
easier interaction with the modules. The simplest module is the asdoc module,
which contains a single target, asdoc.gen; it generates asdoc, and the main
build file exposes a target asdoc to use it.  Another simple module to use is
the test module - to use it, run:

$ ant test 

and it will build everything for testing. The compile-swf module compiles
runnable swf - the compile target in the main build file will do just that. 

The full build target will run the tests, compile the swf, and open it up in a
browser window. The compile-swc library is more complicated - the compile-swc
target in the main file simple compiles it, but the deploy-lib target converts
it to a swf, optimizes the swf, and moves it over. It might not work right for
you; look into the compile-swc module and use what you need. 

Finally, I've added a module for android deployment, android.xml. This module 
should probably only run through the targets in the main file, particularly 
deploy-to-emulator and deploy-to-phone. However, if there are multiple devices 
attached, either real phones or emulators, you will have to go into the targets 
of same name in the android module and modify them to specify the appropriate 
devices (using the -s flag as opposed to the -e or -d flags).
Of course, android development requires setting up the proper SDKs.

Working on windows (vista):
Once you have ant, flashbuilder, and the build.properties all set up nicely,
there are several problems you might run into.

The first thing to check is to make sure that the folder
C:\Windows\System32\Macromed\Flash\FlashPlayerTrust\
is NOT readonly, and that the user has permission to write into the folder.
You'll have to do this if you see some IOError (access denied) message from the
flexunit task. Flexunit needs to write here to communicate with the swf.

Second, make sure that the standalone player that is running is Flash Player
10.  If it's not, search your system for FlashPlayer.exe and look for results
in paths including the word Players. Download the update from adobe, and
replace the Players folder in the system with the one in the update. This will
fix a problem where the TestRunner isn't able to talk to the flexunit listener.

Lastly, you'll probably want to see the generated flexunit report in your
browser.  If you use firefox, you'll want to set the browser variable in
build.properties to C:/Program Files/Mozilla Firefox/firefox.exe or wherever
firefox is installed. For other browser, figure out where they're installed,
and put the path in that file. Remember, always use forward slashes.  The
original build.xml was clearly created by a mac lover, because he made the exec
use "open" which is a mac thing. Instead, the executable for us is ${browser}
and the arg line is file://${report.url} because firefox needs a protocol (in
this case file://) to open stuff up. 


Configuring Browser For Auto Launch

The following is a chart of values to use on each OS to auto launch in a browser

Mac	
Browser		Value
Safari		Safari
Firefox		FireFox
Chrome		'Google Chrome'
	
PC
Browser		Value
FireFox		C:/Program Files/Mozilla Firefox/firefox.exe

