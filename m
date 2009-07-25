From: Stephen - K1LNX <k1lnx@k1lnx.net>
Subject: Problems with net2kiss
Date: Sat, 25 Jul 2009 11:37:01 -0400
Message-ID: <8390870f0907250837j13e27ce4ga4f91609ea53cd6c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I am having a problem with net2kiss on a Debian 5.0 "Lenny" install. I
installed ax25-tools from apt.

If I execute this command:

net2kiss -a -i ax0 -s /tmp/net2kisslink &

It errors out with this:

net2kiss: out of pseudoterminals

I tried increasing the number of available pty's as detailed here:
http://www.cyberciti.biz/tips/howto-linux-increase-pty-session.html
but it didn't help.

I was also able to duplicate this on a fresh install of Lenny on
another machine, maybe something up with the package?

Has anyone ever seen this and how to fix it?

tnx and 73
Stephen

-- 
Stephen Brown - ARS K1LNX
Johnson City, TN EM86
http://www.k1lnx.net
