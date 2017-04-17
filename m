From: f6bvp <f6bvp@free.fr>
Subject: Re: Interesting Rose patch
Date: Mon, 17 Apr 2017 18:15:26 +0200
Message-ID: <74b515a0-0de1-ebaf-a874-b55f2b682efe@free.fr>
References: <20170116.144051.1777999685832100508.davem@davemloft.net>
 <1a4ee351-031c-932e-0332-779ce33e90e6@trinnet.net>
 <20170201080217.4d8443bb@brox.localnet>
 <3e3f25fc-fc60-c01b-1139-245284200656@trinnet.net>
 <39dad041-f224-735e-adb7-e0fb42771858@free.fr>
 <25ee9245-3595-85f7-93b8-a18d6066a2e3@free.fr>
 <07a1454e-99a2-8cec-d50a-006257687c2e@free.fr>
 <12e0547b-cb2c-1ca0-abc0-d849d8a62139@trinnet.net>
 <3d0e170e-3995-84d0-007e-3d2065296237@free.fr>
 <9f9dba49-c2a5-41e8-9382-9154802e7fbf@trinnet.net>
 <20170327163641.0f992e2d@brox.localnet>
 <06ce7640-bbd6-dd5e-05d9-f1afcec680e5@free.fr>
 <309904235.63498.1492029796017@ox-groupware.bfs.de>
 <6bd2a0b4-12b0-0de0-7bc2-e911d3ab4446@free.fr>
 <a4f993a0-b12a-f3e6-455c-16ea2da28737@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <a4f993a0-b12a-f3e6-455c-16ea2da28737@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: David Ranch <dranch@trinnet.net>, Basil Gunn <basil@pacabunga.com>
Cc: C Schuman <k4gbb1@embarqmail.com>, linux-hams@vger.kernel.org, =?UTF-8?Q?Ralf_B=c3=a4chle_DL5RB?= <ralf@linux-mips.org>, Richard Stearn <richard@rns-stearn.co.uk>

Hello David,

Thank you for offering to test the rose issue and validate Richard's patch.

You should first download and install fpac package using the related 
script number 3 from here :

http://f6bvp.org/configuration6_RPi.html

The script will install the whole FPAC package, although we will only 
use fpad application to reproduce the bug.

Rose install using fpad application is straightforward.

In order to let fpad node application run, you may use the following 
three configuration files samples you do not need to edit.

I assume you have already set up at least one ax.25 interface, and have 
/etc/ax25/axports,  for rose runs upon AX.25 network .

All three files must be copied into /etc/ax25/ directory.

Here is /etc/ax25/fpac.conf sample :

#
# This file is /usr/local/etc/ax25/fpac.conf (/etc/ax25/fpac.conf)
#
# node configuration
#
L2call    = F6BVP-6
L3call    = F6BVP-7
Trcall    = F6BVP-15
DNIC      = 2080
Address   = 175525
#Coverage  = 175202 175302 175402
InetPort  = 10095
InetAddr  = 44.168.19.22
Password  = 123456789
City      = Paris
State     = 75017
Country   = France
locator   = JN18DV
UserPort  = *
DefPort   = axudp
#
# Other  commands
#
Command
         VERsions  = /usr/local/sbin/versions
End
#for "sysops"
#
Sysop
      SYSop  = /usr/local/sbin/fpacshell
end
#
# Other applications
#
# TEST
Application
#F6BVP-14 = /usr/local/sbin/call_tcp f6bvp.org 6300
End

Second file is /etc/ax25/fpac.routes :

#
# FPAC ROSE route configuration file
#
# This file is in /usr/local/etc/ax25/fpac.routes
#
# Routes to adjacent nodes
#
# DNIC specify a default DNIC for the following addresses
#
# Address is 1 to 6 digits, using hierarchy
#
Routes
DNIC    = 0
2080    = F6BVP-11
2080    = F6BVP-9
2220    = F6BVP-9
3100    = F6BVP-9
3100    = F6BVP-9
3620    = F6BVP-9
7100    = F6BVP-9
# Routes to adjacent nodes full ROSE address
# DNIC + 6 digits
DNIC    = 2080
175502 = F6BVP-11
175520 = F6BVP-9
End

Third file is /etc/ax25/fpac.nodes

# FPAC ROSE route configuration file
#
# This file is in /usr/local/etc/ax25/fpac.nodes
#
# List of adjacent nodes
#
Node = F6BVP-9
  Path = F6BVP-9
  DNIC = 2080
  Address = 175520
  Port = axudp
  NoWp = 0
End
Node = F6BVP-11
  Path = F6BVP-11
  DNIC = 2080
  Address = 175502
  Port = axudp
  NoWp = 0
End

Again, for this test purpose, you don't need to edit those files, as you 
are not willing to get an actual working node switch.

After installing ax25 and fpac package using the script and putting 
above three files in /etc/ax25, then you are ready to perform the test.

Simply start fpad issuing the command /usr/local/sbin/fpad

If you get the following message : "problem with axports file." it would 
mean you did not start AX.25 before running fpad.

If you need, I could send you a script modified from K4GBB to set up 
AX.25 devices.

Otherwise fpad will display this message :

Configuring routes :
Route 2080175520 -> F6BVP-9 (axudp)
Route 2080175502 -> F6BVP-11 (axudp)
Route 7100000000 -> F6BVP-9 (axudp)
Route 3620000000 -> F6BVP-9 (axudp)
Route 3100000000 -> F6BVP-9 (axudp)
Route 3100000000 -> F6BVP-9 (axudp)
Route 2220000000 -> F6BVP-9 (axudp)
Route 2080000000 -> F6BVP-9 (axudp)
Route 2080000000 -> F6BVP-11 (axudp)

FPAD : ROSE address 2080175525 bound to device rose0


And after a while, you will get the following :

FPAD cannot open WP service
Closing opened sockets
Removing ROSE nodes
FPAD aborting

This is because we did not start correctly the full FPAC suite of 
applications.

It does not matter.

Now we have loaded rose module, created a ROSE device and initiated a 
rose socket.

We want to close down rose0 device the same way we would do it for 
NetRom device using command

ifconfig rose0 down.

This command removes rose0 device. However rose module cannot be removed 
by rmmod rose command.

Instead we enter into a kernel loop waiting for rose module to be free.

I hope this is clear enough to let you reproduce the bug.

Then after applying the patch, you will see that removing rose is fine.


Bernard


Le 13/04/2017 à 16:57, David Ranch a écrit :
>
> Hey Bernard,
>
> So how would you like to proceed here?  I can apply you patch to a 
> kernel and see if my machine remains stable.  If you have a test plan 
> you can share to reproduce issues, I can go through that as well.  
> Beyond that, I don't actively use ROSE today. After that, I imagine we 
> should get the patches signed off and submitted upstream.
>
> --David
> KI6ZHD
>
>
