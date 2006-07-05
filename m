From: Cathryn Mataga <cathrynm@junglevision.com>
Subject: kissattach/kissnetd versus ptyq ttyq and ptmx/pts
Date: Wed, 05 Jul 2006 00:38:14 -0700
Message-ID: <44AB6C66.4050000@junglevision.com>
References: <20060623130355.9211a397.washer@trlp.com>	 <e524c5320606231517s2079aaa7uae807c7c657effdc@mail.gmail.com>	 <Pine.LNX.4.58.0606232331580.961@server.palaemon.co.uk>	 <44AB00AC.7000708@junglevision.com> <620c90570607041948l150297b6ue70236ee277d5ce8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570607041948l150297b6ue70236ee277d5ce8@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

In my original Linux ham radio setup, I had the following...

/sbin/kissnetd -f 1064 /dev/ptyq3 /dev/ptyq4&
sleep 4
/sbin/kissattach -l /dev/ttyq3 lb1 192.168.0.2&
/sbin/kissattach -l /dev/ttyq4 lb2 192.168.0.3&

for creating the loopback device.

Seems that in Fedora 4 ptyq3 and ttyq3 don't exist anymore.  I tried using
MAKENODE ptyq3 and ttyq3 to create these device files, but I don't think 
they're
working?  I get this error.

kissattach: open: No such device or address

I've been googling the pseudo terminals for Linux and it seems that the 
new way is
with ptmx/pts and ptyq3 and ttyq3 are the old style.  But I'm not sure, 
will kissattach
works with these? Or is there a way to get ptyq3 ttyq3 working in Fedora 5?

What's the right way to go about this, these days?
