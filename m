From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: New node questions
Date: Thu, 08 Apr 2004 16:15:27 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40757A9F.32168.37596D@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Hi. I'm setting up a new bbs-node for my local club, to 
replace a dos based one (fbb & bpq). It's based on slackware 
9.1, on a 486, with 2 vhf ports.

Well, I have a lot of questions:


The node:

Slackware 9.1 includes linuxnode. I also found awznode. Is 
there anybody using it, or any other one? Which is best?

There seems to be a standard for nodes to use callsign-4. Is 
that correct?

I've seen some examples setting netrom names for a node 
(mnemonic) preceded with a # as in #NODE. Is that correct. 
Should I use NODE or #NODE as netrom mnemonic for the node?
And what ssid should I use for the netrom port in nrports?


Convers daemon:

I donwloaded and tried htpp-1.22. It works. Then I've found 
htppu-1.5 and conversd-saupp. They seem to be derived one on 
the other, with fixes and patchs. Again, which is best?


Digipeater:

I'm using digi_ned. It's working fine, as standard 
digipeater. I want to enable cross port digipeating (as the 
system has 2 ports). Is there any standard in defining the 
SSIDs for a cross port digi? For example, I'm trying this:

LU6DG    digipeat on the same port (standard digi)
LU6DG-1  digipeat on port 1 (regardless the input port)
LU6DG-2  digipeat on port 2 (regardless the input port)

When crossing ports, it does callsing swaping, and works 
fine. Here's the config for this:

digipeat: 1 LU6DG 1
digipeat: 2 LU6DG 2
digipeat: 1 LU6DG-1 1 keep
digipeat: 2 LU6DG-1 1 swap LU6DG-2
digipeat: 2 LU6DG-2 2 keep
digipeat: 1 LU6DG-2 2 swap LU6DG-1


BBS:

A friend has been trying fbb, and it seems to have a problem 
when doing compressed forward to a dos or windows fbb. Do 
you know something about it?

What about using other bbs program than fbb? What about 
dpbox? Any suggestion?

Thanks for all the help.


-----------------
Rodolfo Brasnarof
LW6EAH
Punta Alta
Argentina

