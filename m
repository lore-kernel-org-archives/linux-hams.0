From: Bill Vodall <wa7nwp@jnos.org>
Subject: Digi-ned output file and logrotate
Date: Tue, 12 Jul 2005 09:21:21 -0500 (CDT)
Message-ID: <Pine.LNX.4.44.0507120916250.14121-100000@srv01.compumont.com>
References: <Pine.LNX.4.44.0507120900580.14121-100000@srv01.compumont.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0507120900580.14121-100000@srv01.compumont.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Another Linux question:


Is it possible to use syslogd on stdout from an application?


I'd like to save the verbose output from digi_ned in a file
for monitoring.  I don't want the file to get too large.

Restarting the program on a regular basis would be one solution
but I'm hoping for something cleaner.


Hmmm.   Maybe "logrotate" is what I'm looking for.   

Any suggestions or hints?

Thanks,
Bill - WA7NWP


