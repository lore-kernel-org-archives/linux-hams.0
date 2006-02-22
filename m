From: Curt Mills <archer@eskimo.com>
Subject: RE: AX.25 for dummies
Date: Tue, 21 Feb 2006 18:29:51 -0800 (PST)
Message-ID: <Pine.LNX.4.58.0602211827030.6467@wapiti.we7u.net>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOEHnGq+Wf1PksDlzJEv6TzCgAAAEAAAAHd3cx/yAoZFsdqd1rAmwbkBAAAAAA==@arrl.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAOEHnGq+Wf1PksDlzJEv6TzCgAAAEAAAAHd3cx/yAoZFsdqd1rAmwbkBAAAAAA==@arrl.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Chris Hare, W5CDN" <w5cdn@arrl.net>
Cc: 'Jack Sterba' <jack@collective.homelinux.net>, 'Linux-Hams' <linux-hams@vger.kernel.org>

On Tue, 21 Feb 2006, Chris Hare, W5CDN wrote:

> I am using RedHat Enterprise Release 4.  I have two TNCs, one KPC-3 and one
> KPC-3+.  My frustration was around trying to understand all the config files
> etc and the relationships between them.  I am moving my home APRS station to
> xastir, which the manual says must use AX.25

Nope!  If you don't believe me, ask one of the Xastir developers...
Ok, I still say nope!  ;-)

Xastir can use a variety of interfaces to accomplish the goal.  I
personally have used KISS TNC's via AX.25 kernel interfaces,
soundcard via serial KISS interface, serial TNC via serial TNC
interface, and am currently using a TNC-X (KISS TNC) via a serial
KISS TNC interface in Xastir.

I highly recommend KISS for the TNC, but if you're not needing to
share the TNC across multiple applications at the same time, use
Xastir's Serial KISS TNC interface.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
  Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
