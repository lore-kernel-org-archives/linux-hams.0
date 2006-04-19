From: Curt Mills <archer@eskimo.com>
Subject: Re: Broadcasting unwanted UDP messages
Date: Tue, 18 Apr 2006 20:50:48 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0604182049520.18174@wapiti.we7u.net>
References: <4445B27F.5050206@irock.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4445B27F.5050206@irock.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vk4akm@wia.org.au
Cc: linux-hams@vger.kernel.org

On Wed, 19 Apr 2006, Ken Moore wrote:

> G'day Folk,
> 
> My ax25 system (Debian system with Linpac and Soundcard modem) is broadcasting
> network Samba and Netbios UDP messages.
> Being almost illiterate with Linux could someone point me in the right
> direction to stop this.
> I have checked the files in /etc/ax25/ but nothing seems to relate.
> 
> Where should I start looking?

www.samba.org perhaps.  There's a Samba config file setting that
tells it not to broadcast on certain ports.  I can't remember what
it is, sorry, but a Google search should find it.  It's a common
problem with AX.25 interfaces.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
  Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
