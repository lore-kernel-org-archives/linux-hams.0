From: "Ben Gelb" <ben@gelbnet.com>
Subject: RE: Which version for RH6.2
Date: Sun, 29 Sep 2002 20:57:17 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <001101c2681c$55bf0430$0bc43e2c@ben>
References: <4.3.2.7.2.20020929194216.00acb9c0@pop3.norton.antivirus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4.3.2.7.2.20020929194216.00acb9c0@pop3.norton.antivirus>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'John J. Bauerly'" <jbauerly@grapevine.net>
Cc: linux-hams@vger.kernel.org

If you compile from source, I don't think it makes an ounce of
difference.

You can get the sources at
http://sourceforge.net/project/showfiles.php?group_id=24545

If you are looking for an rpm, you might have a hard time. As I recall,
RH6.2 uses RPM 3. All of the new RPMs from RedHat are for RPM 4.

I did a quick search on rpmfind.net and found the following RPMs being
listed as part of the PowerTools-6.2 for i386 distro. I think this is
like "add-ons" for RedHat.

http://www.rpmfind.net/linux/RPM/powertools/6.2/i386/i386/libax25-0.0.7-
2.i386.html

http://www.rpmfind.net/linux/RPM/powertools/6.2/i386/i386/ax25-tools-0.0
.6-2.i386.html

http://www.rpmfind.net/linux/RPM/powertools/6.2/i386/i386/ax25-apps-0.0.
4-3.i386.html


OR,

You can avoid the whole RPM mess altogether and use Debian. This is what
I would personally recommend. It has a far superior packaging system,
you just type 

apt-get install ax25-tools 

and it downloads ax25-tools and all the package(s) it depends on (like
libax25) for you, installs them all, and you're set.

But if you like RedHat and RPMs, that's certainly your right.

Hope this helps!

73 de Ben, KF4KJQ

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of John J. Bauerly
Sent: Sunday, September 29, 2002 8:44 PM
To: linux-hams@vger.kernel.org
Subject: Which version for RH6.2

Hello;

I am upgrading my system to Red Hat 6.2. Which version of ax25 utilities
is 
compatable with this?

John J. Bauerly NW0I

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


