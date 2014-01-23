Kongregate API Tester
=====================

A small test flex "game" written in flixel to exercise various functionality of the Kongregate flash API.

Building the SWF
================

Install Flex 4
--------------
1. Download the SDK from [Adobe's Website][1]
2. Extract the archive

    `unzip flex_sdk_4.6.zip /path/to/flex`

3. Add flex to your path

    `echo 'export PATH=$PATH:/path/to/flex/bin' >> ~/.profile; . ~/.profile`

Get Flixel
----------
1. Grab the flixel submodule

   `git submodule update --init`

Build
-----
1. Build the game with mxmlc

    `mxmlc src/DerpGame.as -static-link-runtime-shared-libraries=true -o derp.swf`

*Note: If you want trace output to show up (by default, in `~/Library/Preferences/Macromedia/Flash Player/Logs/flashlog.txt`), or use `fdb` to debug, you need to compile with the `-debug` option: `mxmlc src/DerpGame.as -static-link-runtime-shared-libraries=true -debug -o derp.swf`*

[1]: http://www.adobe.com/devnet/flex/flex-sdk-download.html "Adobe Flex SDK"
