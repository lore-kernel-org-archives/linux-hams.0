From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: ax25d not hearing incoming connection requests (fwd)
Date: Sun, 13 Mar 2011 08:45:47 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1103130845260.7815@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:subject:message-id:user-agent
         :mime-version:content-type;
        bh=8fAGmYSRcoxXBpS0wyZQjjYhrSDYIZZKWUYsJ8Kr7DM=;
        b=wFxOQclHYsFvZuyMDHOV1mLIyQITflg8gWR/zOnbXlwTlHdV5Sr63kaMs2QL+e3NXm
         nC56o2Xy8Cz0vYGwtsiFKl5nQM01oIOoQmWG3r6D84QY5PDpr9gMIGuDwjGHt743MZb9
         2cW4wFcThrPiLV3NAhQtLt8QVTuzJ8jx532AA=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


2nd of two messages summarizing results from testing a couple of years ago.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
Babysitting your tracker:  http://info.aprs.net/index.php?title=ControlOperator

---------- Forwarded message ----------
Date: Sat, 17 Jan 2009 22:16:16 -0800 (PST)
From: "Curt, WE7U" <archer@eskimo.com>
To: Jon Sowman <jon.sowman@gmail.com>
Cc: Ken Koster <n7ipb@wetnet.net>, kd7nm@arrl.net, archer@eskimo.com
Subject: Re: ax25d not hearing incoming connection requests


So... Here's the final deal:  I have it working with Bob able to log
in and create his account automatically.  With "useradd" selected in
the axspawn.conf file this didn't work, but the shell went to high
cpu and then when killed, "useradd" went to high cpu.  I had to kill
it then.  "useradd" created more files in the home directory it
created and it added to both "/etc/passwd" and "/etc/shadow", while
the auto-creation of accounts without "useradd" created few files
and only used "/etc/passwd".

As root I then had to change the password for user "kd7nm".  After
that he could log on with the 2nd configuration (_not_ using
"useradd" to create it).

It looks like the ax.25 stuff hasn't been updated to handle the
/etc/shadow scheme, where the encrypted passwords are held there
instead of /etc/passwd.  The passwords _can_ still be in
/etc/password which is what the 2nd scheme does (and it works), but
that's just not right.

Also:  It appears that lots of information is getting dropped, for
instance when Bob does an ls listing of /usr/bin he only sees a
couple of lines containing files starting with 'z'.  All the rest
just disappear and are not transmitted.  Another bug.

Hopefully on your 2.4 kernel things will work a bit better.  The
2002 configs that Ken sent might match that one exactly as that was
also a 2.4 system.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
