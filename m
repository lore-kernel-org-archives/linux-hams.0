From: "Chris Hare, W5CDN" <w5cdn@arrl.net>
Subject: RE: AX.25 for dummies
Date: Tue, 21 Feb 2006 12:28:24 -0600
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAOEHnGq+Wf1PksDlzJEv6TzCgAAAEAAAAHd3cx/yAoZFsdqd1rAmwbkBAAAAAA==@arrl.net>
References: <20060221180648.CZXV1818.ibm66aec.bellsouth.net@bigj>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060221180648.CZXV1818.ibm66aec.bellsouth.net@bigj>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jack Sterba' <jack@collective.homelinux.net>, 'Linux-Hams' <linux-hams@vger.kernel.org>

I am using RedHat Enterprise Release 4.  I have two TNCs, one KPC-3 and one
KPC-3+.  My frustration was around trying to understand all the config files
etc and the relationships between them.  I am moving my home APRS station to
xastir, which the manual says must use AX.25 and the winlink NTS station to
FBBS.  Both of the windows apps didn't need KISS mode, so this has be just a
little frustrated.  :-) (I think it is a case of complexity where none is
required, but that is just my opinion.  :-) 

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Jack Sterba
Sent: Tuesday, February 21, 2006 12:07 PM
To: Linux-Hams
Subject: RE: AX.25 for dummies


> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org [mailto:linux-hams- 
> owner@vger.kernel.org] On Behalf Of Jeremy Utley
> Sent: Tuesday, February 21, 2006 12:28 PM
> To: linux-hams@vger.kernel.org
> Subject: Re: AX.25 for dummies

* SNIP *

> While it is true that the AX.25 HOWTO has not been updated in many 
> many years, the process for setting up AX.25 interfaces really hasn't 
> changed much since the 2.2.x kernel series, so those same basic 
> instructions will work on the latest 2.6.15 kernel as did a 2.2.10 :) 
> There can sometimes be a couple of gotchas related to 
> multiple-interface TNC's, the use of mkiss, and modern linux 
> distributions which use udev, but those are easy to work around as 
> well.  Best thing you can do is work thru the howto, and come to the 
> list here to ask questions - someone will gladly help you out.
> 

Yes, there are some little quirks with KPC9612's that we fought with to get
the Orlando FPAC switch working. If needed, I can gladly post the
appropriate ax25 config files so that you can save yourself some time and
trouble. Just make sure that your ax25-tools and -apps (0.0.8) and libax25
(0.0.11) are up to date and it should be pretty easy. BTW, feel free to
correct me on the versions if I am wrong. Just out of curiosity, what
distribution of linux are you using?

Jack KB9LEB

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html

