From: "Stephen Brown Jr" <stephen.brown75@gmail.com>
Subject: Problems with AXIP
Date: Sun, 4 Mar 2007 20:54:20 -0500
Message-ID: <dd22fa9c0703041754p2cab7ffnec39851fddc2f387@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        b=f/Em4fuRmUVEd+AIIPHY88b8zDH9wd7tmbJQnfHjfmIkU/x1C0SxzkQ2CcAsAzd7hEoqz58qbOKVkqBfNcDRJSlG0o3S0VElvju6I4G34z1N59/SNSjvyiDGBqpGNGeuhmoYZlIqfwT0eY5xi3ajzjQd9g63+T8SeYChV8r8KmI=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I have been frantically trying to get AXIP using UDP setup between a
couple of boxes for APRS use and I am about at my wits end. I stumbled
across this list while searching for information, so I'm hoping
someone here can help me.

Basically what I have are two boxes, 1 is running Debian 3.1 with a
custom 2.4.33 kernel and AX.25 support compiled directly in. The other
box is Ubuntu 6.06 with the standard K7 kernel that can be found in
the repository. I have libax25, ax25-apps, and ax25-tools setup on
both machines, both were installed from the repositories.

I setup my axports file as well as ax25ipd.conf files on both
machines. Ran kissattach to ptyp0 on the ubuntu machine, ptyp1 on the
debian machine(I already have an existing AXIP link to another system
on ptyp0 on this machine, because of that I created a seperate ax25ipd
config file on this box and started ax25ipd with the -c flag)

Now, I've either got something setup wrong, or I have a false
indication of how this stuff is supposed to work. In theory, I'm
thinking that I should see any traffic that I send from my Ubuntu
machine show up on the debian machine using listen? I can see it
leaving the Ubuntu machine using listen, but I do not see it on the
debian machine. I am sending standard APRS UI beacons from Xastir that
look like this:

sbrown@onyxia:~$ sudo listen -a -p aprslcl
aprslcl: fm N1VLV-1 to APX184 via WIDE2-2 ctl UI^ pid=F0(Text) len 60
0000  =3619.24N/08217.40WxN1VLV Xastir 1.8.4 http://www.n1vlv.com .

Yet, I get nothing on the other box. It's not a LAN problem, I am on
the same subnet, no firewalls, I can ping each box etc.

Again, I may be expecting this to do something it is uncapable of, or
something is broken or misconfigured?

If anyone can help with this frustrating issue it will most certainly
be appreciated, I can post up configs etc if needed.

Stephen
N1VLV
