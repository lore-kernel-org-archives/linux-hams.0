From: Bob Nielsen <nielsen@oz.net>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 03:03:47 -0800
Message-ID: <2A0DE4EA-4C12-4827-9C21-B2AF43887BCE@oz.net>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca> <d5d4185b0601291929r3193867nd1e8292455427be2@mail.gmail.com> <Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org>
Mime-Version: 1.0 (Apple Message framework v746.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-hams@vger.kernel.org


On Jan 30, 2006, at 1:47 AM, Ted Gervais wrote:

> On Sun, 29 Jan 2006, Jeremy Utley wrote:
>
>> On 1/29/06, Ted Gervais <ve1drg@av.eastlink.ca> wrote:
>>> What is the command to take my kpc-9612 out of kiss mode and also  
>>> to put it
>>> back in kiss.
>>> I want to do this from a linux console rather than through an
>>> application.  Just a simple way of bringing up an empty terminal   
>>> on my
>>> linux machine and typing in something that will talk to the tnc.
>>
>> I don't know about the 9612, but on both the KAM and KPC3 to drop out
>> of KISS mode into normal mode, you sent a series of 3 ASCII  
>> characters
>> - ASC 192, ASC 255, ASC192.  In the old days I did this via the
>> Alt+numeric keypad method.  I suspect the 9612 is the same, as
>> Kantronics has usually stayed pretty stable with their command set.
>
> Alright.  I remember that.

Curt, WE7U created kiss-of.pl, a perl script that is part of Xastir  
to do that.  Here is the pertinent section:

# This script will send the proper characters to STDOUT to command a
# KISS TNC out of KISS mode.  Redirect it to the port that the TNC
# is connected to.  Turn off the port in Xastir first.

# It is assumed that the baud rate on the port and the baud rate of
# the TNC match, if not, this won't work.  If you've just been using
# the TNC in Xastir, they probably match.

# Use the script like this:
#
# ./kiss-off.pl >/dev/ttyS1
#


sleep 1;
printf("%c%c%c", 192, 255, 192);
sleep 1;

You would need to set the serial port speed to match the TNC using  
setserial prior to doing this.

>>
>> To shift back into KISS mode, you must have the "command" prompt, not
>> be in convers mode - then just sending the commands "interface kiss"
>> followed by "reset" will place the KAM into KISS mode.
>
>
> Yes.  But can you get into the "command" prompt from a linux console??
> Or is that only possible using Dos.??

You need to be able to talk to the TNC through a serial port.  I  
recall using Minicom to do this in Linux some eons ago (I have been  
using KISS-only EPROMs for the past ten+ years and haven't needed to  
do this), although redirecting the contents of a text file to the  
serial port should work, provided the TNC was in command mode.

73,
Bob N7XY

