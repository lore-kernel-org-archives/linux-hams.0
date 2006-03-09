From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: Re: Serial extenion cable...
Date: Thu, 09 Mar 2006 09:13:29 -0800
Message-ID: <44106239.1000902@jnos.org>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOEHnGq+Wf1PksDlzJEv6TzCgAAAEAAAABhvz93VzM5Ktcs9EAQKUtMBAAAAAA==@arrl.net> <Pine.SUN.4.58.0602210817400.27517@eskimo.com> <440FBEBF.9020908@nwp.ampr2.net> <Pine.SUN.4.58.0603090657250.12513@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0603090657250.12513@eskimo.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org



Curt, WE7U wrote:
> On Wed, 8 Mar 2006, Bill wrote:
> 
> 
>>Sorry to bug folks again if I brought this up last summer, but the need
>>for an "serial tunnel" has again come up.
>>
> Answered in Xastir FAQ, question 4.20.  "netcat" is probably your
> best bet.

Faq is at: 
<http://cvs.sourceforge.net/viewcvs.py/xastir/xastir/FAQ?&view=auto>

Netcat puts a serial or parallel port on an IP channel.  Useful but not 
what I needed.  'remserial' from the Xastir faq was the solution and 
it's working.

   http://lpccomp.bc.ca/remserial/

Here's a packet from the remote YYDIGI Linux box as heard on the 
'listen' screen of my miniItx.

---
axyy: fm KB7UVC-3 to APW251 via OLY* KOPEAK* WIDE2 ctl UIv id=F0(Text) 
len 37 08:51:11
0000  Mason County WA EOC Computer On-LineM
---

More notes on the wiki:

   http://wiki.ampr2.net/jnos/RemoteSerial

Thanks for the bandwidth.  Always good to start a day with a step forward.

73
Bill - WA7NWP

