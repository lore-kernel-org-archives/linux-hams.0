From: Stephane Fillod <f8cfe@free.fr>
Subject: Re: newbie question - hamlib and gMFSK
Date: Tue, 4 May 2004 00:56:12 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040503225612.GJ1599@charybde.local>
References: <1083420366.4194.8.camel@dhcppc3> <4093B61F.6090305@aa6e.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4093B61F.6090305@aa6e.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Ewing <martin@aa6e.net>
Cc: linux-hams@vger.kernel.org

Hi Martin,

On Sat, May 01, 2004, Martin Ewing wrote:
> Hamlib seems to be an effort to make a device-independent layer between 
> rigs, with various interfaces, and rig-control software.  Coverage is 
> incomplete, and there don't seem to be many software packages built to 
> use hamlib.

http://hamlib.org/app.html

It's up to you to add more ;-)

> I have been using KPSK and gMFSK with some success, and also jLog 
> software (Java).  These are all self-contained packages with their own 
> audio and/or rig interfaces -- no relationship to hamlib.

gMFSK relies on Hamlib. I'd be happy to help authors of KPSK/jLog/..
to integrate with Hamlib.

> I have written some Python-based software to operate the PSKmeter device 
> and for Orion rig control (www.aa6e.net/aa6e), but again no connection 
> with hamlib.

Next version of Hamlib will have basic support for the Orion rig,
I've just added it in CVS of Hamlib tonight :-)

Do you want to be the maintainer of this backend?

FYI, Hamlib has also a Python wrapper.


73,
Stephane - F8CFE
