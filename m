From: Chuck Hast <wchast@gmail.com>
Subject: Testing ax25 and network using call
Date: Wed, 3 Nov 2004 22:59:28 -0800
Message-ID: <620c905704110322596924e940@mail.gmail.com>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

I have the ax25 stuff working. I can issue a CALL command to connect to a
nearby FPAC switch as a ax25 user.

But when I try to use it with ROSE I get the following
The GW4PTS line
Trying...
connect: Invalid argument.

My rsport is rose and I am attempting to connect to node at a address of
3100813224
I have used rsparms to tell the app that the next door neighbor switch
is kc5qcn-9  and the address of that switch is 3100813224
If I issue the rsparms -node list  I see that 3100813224 is on port
sp0 (using 6pack) and the neighbor switch call is kc5qcn-9

This is the format I am using;
call rose node 3100813224

Node is the node app which resides at swithc 3100813224

Anyone have a idea of why this is failing?

-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
