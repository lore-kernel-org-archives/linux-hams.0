From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: Writing AX.25 Server Progie
Date: Thu, 2 Jan 2003 11:33:06 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0301021130570.18470-100000@wapiti.tc.fluke.com>
References: <22899838.1041516788@WUSJA129861-8HP.corp.ncr.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <22899838.1041516788@WUSJA129861-8HP.corp.ncr.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Ackermann N8UR <jra@febo.com>
Cc: Chuck Gelm <nc8q@gelm.net>, linux-hams@vger.kernel.org

On Thu, 2 Jan 2003, John Ackermann   N8UR wrote:

> Second, there's one snag in the Xastir build process that Curt didn't
> mention.  I am using the kernal ax.25 tools, and unless the xastir binary
> is made suid root, it can't open the ax.25 connection.  To solve that, as
> root do "chmod u+s /usr/local/bin/xastir"

Ahh, but I did mention it!  Kind'a sort'a:  "chmod 4555" does the
same thing.  You have to think in octal though...


> (assuming that's where it's
> installed).  suid root is a security risk, but for the typical ham machine
> it's probably an acceptable one, and is less dangerous that living your
> life as root!

Good points.  Thanks for mentioning that!  The Xastir's README.1ST
file has a bit more on this topic and the pro's and con's.

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

