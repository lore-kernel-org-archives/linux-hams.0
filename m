From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: Net2kiss - multiple ports
Date: Tue, 21 Feb 2006 11:22:16 -0800
Message-ID: <43FB6868.3070802@jnos.org>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOEHnGq+Wf1PksDlzJEv6TzCgAAAEAAAABhvz93VzM5Ktcs9EAQKUtMBAAAAAA==@arrl.net> <Pine.SUN.4.58.0602210817400.27517@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0602210817400.27517@eskimo.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org



Has anybody looked at tweaking net2kiss to handle multiple net streams? 
  This would be the reverse of mkiss...   I have two ax25 ports.  APRS 
and EOC.  It would be neat to be able able to merge them on to a single 
KISS stream with different KISS channel id's -- like the KISS output of 
a dual port TNC such as a KAM or 9612.

Instead of:

   /usr/sbin/net2kiss -i ax1 /dev/ptyp8

We'd do something like:

   /usr/sbin/net2kiss -i ax1 -i ax0 /dev/ptyp8


There's always some way to make a good tool better...

73
Bill - WA7NWP

