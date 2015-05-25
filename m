From: David Ranch <linux-hams@trinnet.net>
Subject: Linpac 0.21 (AX.25 packet radio application) posted
Date: Mon, 25 May 2015 10:51:27 -0700
Message-ID: <5563611F.5020204@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>


Hello Everyone,

This is just a heads up that I have posted Linpac 0.21: 
https://sourceforge.net/projects/linpac/


What is Linpac?

LinPac is an Ncurses based AX.25 packet radio terminal for use with 
Linux's native AX.25 stack.  It mimics many of the feature packed 
HOST-MODE programs that used to exist for Dos (PkGold, etc) but with any 
TNC running in KISS mode. It allows wide configuration and easy addition 
of new functions and special functions needed by the user. It's intended 
for keyboard-to-keyboard use but also supports receiving basic PBBS 
messages, local Converse-link chat rooms, basic node commands like 
mheard and making outgoing connections, etc.

The aim was to minimize the amount of 'hard coded' functions and create 
a complete set of applications that can be easily expanded and/or 
completely reconfigured via a simple macro language.  There is also a 
developing GUI version (1.x branch) that provides either a Java Swing 
GUI or the familiar Ncurses UI.


Changes since 0.20:
--
Memory cleanups
Fixed Debian based ncurses package dependency
Added a cron-able script that can send email and SMS notifications when 
you get a new Linpac message
Added a script to start linpac via screen for being able to detach and 
re-attach to the session from anywhere
Added some Ncurses fixes for spurious "x"'s showed up instead of 
vertical lines
Added lots of things to the linpac-todo.txt  (we'd love to get more C 
developers to help out if you have some time)
--

There aren't any binaries posted at the moment but I can email Centos6 
RPMs and Raspian(wheezy) .debs if requested.  Everyone else will need to 
read the README file included in the sources on how to install the 
required dependencies and build the package yourself.  It's not hard and 
is quite fast.  Once installed, Linpac will NOT work without a properly 
configured Linux AX.25 stack.  There are many resources out on the 
Internet on how to do this and I can help out as well if requested.

--David
KI6ZHD
