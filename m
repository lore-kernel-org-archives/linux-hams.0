From: John Ackermann N8UR <jra@febo.com>
Subject: Re: Writing AX.25 Server Progie
Date: Thu, 02 Jan 2003 14:13:08 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <22899838.1041516788@WUSJA129861-8HP.corp.ncr.com>
References: <Pine.LNX.4.33.0301021052220.18470-100000@wapiti.tc.fluke.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0301021052220.18470-100000@wapiti.tc.fluke.com>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Curt Mills, WE7U" <hacker@tc.fluke.com>, Chuck Gelm <nc8q@gelm.net>
Cc: linux-hams@vger.kernel.org

Two things to add to Curt's reply:

First, I can vouch that Xastir works great!  Chuck, I've been up and 
running with it just about full time (plus or minus hardware hiccups) for 
the last few months.  You should be able to see me on your APRS map of the 
Dayton area with the "X" icon.

Second, there's one snag in the Xastir build process that Curt didn't 
mention.  I am using the kernal ax.25 tools, and unless the xastir binary 
is made suid root, it can't open the ax.25 connection.  To solve that, as 
root do "chmod u+s /usr/local/bin/xastir" (assuming that's where it's 
installed).  suid root is a security risk, but for the typical ham machine 
it's probably an acceptable one, and is less dangerous that living your 
life as root!

73,
John

--On Thursday, January 02, 2003 11:02 AM -0800 "Curt Mills, WE7U" 
<hacker@tc.fluke.com> wrote:

> On Wed, 1 Jan 2003, Chuck Gelm wrote:
>
>>  Thanks for your informative response.
>> I'll try a 'stable' release of Xastir soon.
>
> No!  Try the latest "development" package instead!  :-)
>
>
>> However, I have no idea what CVS is.
>> Is CVS are requirement?
>
> _I_ think it is!  ;-)
>
> CVS stands for Concurrent Versions System.  It's built on top of
> RCS, so you need both installed.
>
> Here's what you can do as a user.  Following are two LONG lines, so
> if your e-mail is wrapping them, unwrap them before typing.  They
> will create an "xastir" directory where you are sitting and populate
> it with the latest sources:
>
>
> cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/xastir login
>
> cvs -z3 -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/xastir co xastir
>
>
> When prompted for a password for anonymous, press the Enter key.
>
> Ok.  Now that you have Xastir sources sitting there (wasn't that
> easy?), you can do this:
>
>
>     cd xastir
>     ./configure
>     make
>     make install-strip;chmod 4555 /usr/local/bin/xastir
>
>
> Now you have Xastir installed.
>
> To update to the latest developers code, you do this:
>
>
>     cd xastir
>     cvs update
>     make install-strip;chmod 4555 /usr/local/bin/xastir
>
>
> The "cvs update" part takes only a few seconds, 'cuz it just snags
> down the patches to the code, and not the whole stinkin' sources.
> It makes it very fast/easy to keep up with the latest.  You can do a
> cvs update immediately after a developer anywhere in the world has
> submitted changes, and you'll get them.  How's that for up-to-date
> code!
>
> Some people do an update every day.  If changes come down, they
> compile/install.  The codebase moves pretty fast sometimes.
>
> --
> Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
> Senior Methods Engineer/SysAdmin
> "Lotto:    A tax on people who are bad at math!"
> "Windows:  Microsoft's tax on computer illiterates!" -- WE7U
> "The world DOES revolve around me:  I picked the coordinate system!"
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>



----
John Ackermann    N8UR         jra@febo.com     http://www.febo.com
President, TAPR                n8ur@tapr.org    http://www.tapr.org

