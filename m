From: Martin Ewing <martin@aa6e.net>
Subject: Re: newbie question - hamlib and gMFSK
Date: Sat, 01 May 2004 10:37:19 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4093B61F.6090305@aa6e.net>
References: <1083420366.4194.8.camel@dhcppc3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1083420366.4194.8.camel@dhcppc3>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: n5nw@n5nw.org, linux-hams@vger.kernel.org

Marty,

Hi.  I'm relatively new to the ham/linux game myself, but I have a 
pretty long experience with hamming and Linux separately.

The general state of Linux stuff for ham radio is primitive, IMO.  The 
linux-ham group apparently originated to serve the "ham" extensions to 
the Linux kernel -- mainly AX.25 -- which are now pretty dated.  (The 
group will correct me if I'm wrong!)  However, this group may be a good 
way to reach the "right" kind of folks.  You may also have discovered 
http://radio.linux.org.au .

Hamlib seems to be an effort to make a device-independent layer between 
rigs, with various interfaces, and rig-control software.  Coverage is 
incomplete, and there don't seem to be many software packages built to 
use hamlib.

I have been using KPSK and gMFSK with some success, and also jLog 
software (Java).  These are all self-contained packages with their own 
audio and/or rig interfaces -- no relationship to hamlib.

I have written some Python-based software to operate the PSKmeter device 
and for Orion rig control (www.aa6e.net/aa6e), but again no connection 
with hamlib.

The reality seems to be that the intersection of Linux and ham radio is 
a great place to be if you're a programmer or experimenter, but the vast 
ham market share is in the Windows world.  It takes a pretty farsighted 
developer to put in lots of time to make advanced (user friendly, device 
independent, multi-mode) software for Linux when nearly all the 
potential users are on Windows.  So, we have MixW, MultiPSK, etc. for 
Windows and nothing similar AFAIK in Linux.

I wish it were otherwise, and I'm doing my small part.

73, Martin, AA6E

N5NW Marty wrote:

>I have finally successfully installed gMFSK and hamlib, but gMFSK
>doesn't seem to recognize that hamlib exists.  No options for
>configuration under preferences.
>
>Hamlib works, as I can use rigctl and query the TS-570DG and get
>frequency and mode.
>
>Any thoughts?  I'm trying to move completely away from the Microsoft
>environment in the shack, and this seems like a critical step.  I am
>very much the newbie with linux - not much beyond the
>./configure|make|make install stage.  I'm using Mandrake 9.2 in a triple
>boot environment (DOS/Win98/Linux).
>
>If there is a more appropriate forum for the question, please advise.
>
>de N5NW (Marty)
>Bellbrook (Dayton), Ohio
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
>  
>

