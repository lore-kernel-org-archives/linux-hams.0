From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: problem serial/USB stick and Xaster
Date: Mon, 16 Aug 2010 12:17:55 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1008161213400.19029@wapiti.we7u.net>
References: <4C61C34F.7050704@skypro.be>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :in-reply-to:message-id:references:user-agent:mime-version
         :content-type;
        bh=76dW7RF8/psoCaMbnYr6gOAMriCAPfRBigm//9RsxCg=;
        b=Q+R7MnuQl3LdXrAw+BLsxVLfcFN+zQZejYZnfld+ozoPWDz1cLq029ycg8tX48q7bH
         vxeauGNgJvFquaFCHuI08M/FH+t42Q/tW/7gR7F+cd0c30uNbTPdoburBcKd2jsPkBql
         Yo1G3hkCV/EsXgM5L38csSwM1Aq1LLCABlEGc=
In-Reply-To: <4C61C34F.7050704@skypro.be>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Kristoff Bonne <kristoff.bonne@skypro.be>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Tue, 10 Aug 2010, Kristoff Bonne wrote:

> I do not know if this is the correct ML for this, so feel free to let me know 
> if there is a better place for this.

     Try the Xastir mailing list at www.xastir.org


> It shows itself as "/dev/ttyUSB0" on my box (ubuntu 10.06 netbook release).

Have you verified that you're a member of the group for
/dev/ttyUSB0?  If you just added yourself to that group for testing,
log out/log in again to gain those new permissions.  Make sure that
group permissions are rw also on that port.

Alternatively:

     sudo chmod 4755 /usr/local/bin/xastir

Which will set the SUID bit on the Xastir executable, letting it
assume root privileges when it needs to deal with the ports.  It
drops to normal user privileges when it's not doing the above.  Note
that this can be a security issue, setting the SUID bit on an
executable, but if you're the only one using the machine you're
relatively save with Xastir because we do drop privileges when we
don't need them.


> - minicom works OK (both with the normal serial port and with the USB-stick)
> - Xastir with the USB-stick gives rubish
> - Xastir with normal serial port works OK.


> Is anybody familiar with a "known issue" with Xastir about this?

Nope.

-- 
Curt, WE7U.                         <http://www.eskimo.com/~archer>
    APRS:  Where it's at!                    <http://www.xastir.org>
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
