From: John@man.ac.uk
Subject: Changes to Predict 2.2.1 for Linux
Date: Mon, 18 Nov 2002 12:34:28 +0000 (GMT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E18Dl9F-000Fr2-00@probity.mcc.ac.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amsat-bb@amsat.org
Cc: linux-hams@vger.kernel.org

Changes to Predict 2.2.1 for Linux
==================================

In this document I will try and detail some of the changes made to Predict 
version 2.2.1.

Satellite Selector
==================

I have replaced the standard 'select a satellite by letter' with some code to 
present the list of satellites by a scrolling menu. This way the program is 
capable of handling more satellites.  I concatenated all the TLE files that I 
could find and had the program running with 938 satellites, but have since set 
a more practical limit of 250.

The new selector is used by the 'P', 'V', 'S', 'T', 'E' and 'D' main menu 
options.

The selector displays the Satellite name and designator from the TLE data for
each satellite.

Single Track Display
====================

You can use the up/down arrow keys on the keypad in addition to the '<' and '>' 
to control the transponder frequencies.  The left/right arrows wil step 
forwards/backwards through the satellites. (there is a buggette here which shows
up when you move to a satellite that is not in predict.db which appears with
transponder frequencies but no labels from the previous satellite - to be fixed
soon)

Multiple Track Display
======================

This is where a lot of changes are visible.  In the standard code, this display was only capable of displaying 24 satellites at once whether they are above or 
below the horizon.i With a list of the next three upcoming passes.

I looked at this from another angle, and put the satellites above the horizon 
at the top, and the use a sorted list of the remainder below that.

This has left the program with more space for other details. I have added an 
extra decimal point to the 'Azimuth' and 'Elevation' columns, and three extra 
columns:

	Satellite Altitude, 
	Ascending/Descending indicator '/' '=' '\', and 
	Next AOS/LOS.

The Sub-Satellite point can be toggled using the 'l' and 'm' keys between:

	Latitude and Longitude
	Maidenhead Locator

The Satellite Altitude and Range distance units can be toggled using the 
'k' and 'i' keys between:

	Imperial (miles)
	Kilometres

The defaults are 'Maidenhead Locator' and distances displayed in 'Miles'
(as I still think in miles :-))

On the left of the multitrack display you will find:

	Home QTH (data from ~/.predict/predict.qth)
	Sun Position
	Moon Position and
	Control keys ('i', 'k', 'l', 'm' and 'q')

The Azimuth/Elevation for the Sun and Moon change in colour whether above or
below the horizon.

I have played around with some colour coding of the block of satellites that
appear in the first section, to try and make the display a bit more readable
with a casual glance. The satellites farthest away show up as

	blue on white, then
	black on white, then 
	black on cyan, then 
	blue on yellow, then with the closest as
	white on red,

The colours are based on a combination of satellite altitude and ranges, and 
may sound odd at first but gets easier to understand when you have watched the 
display for a while.

Other Changes
=============

There are lots of minor cosmetic changes to other parts of the program,
including a new Daynum2String function that can handle almost any format of 
date output.

The length of an X-window can be adjusted dynamically, which is useful with 
the Calendar and MultiTrack displays.

You can see some screenshots and download my modified copy of Predict
2.2.1 at:

	http://voyager.mcc.ac.uk/Predict/

If you find any bugs in this version that don't exist in the standard version, 
then pester me to get them fixed, and not KD2BD who has enough on his plate 
producing excellent software for me to play around with.

John
-- 
  John Heaton, G1YYH
  Manchester Computing, Kilburn Building.
  The University of Manchester, Oxford Road, Manchester, England, M13-9PL
  pstn://+44-161-275-6011/Hello/Is.Dat-U?
  fax://+44-161-275-6040/screech/warble/ssshhh/beepbeep



