From: James Cutler <jwc@stanford.edu>
Subject: Problems with UI frame reception
Date: Mon, 22 Jul 2002 21:35:21 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.GSO.4.44.0207222123320.13893-100000@rescomp.Stanford.EDU>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello,

I'm working with UI frames and am having problems with receiving UI
frames.  I've written a simple send and recieve pair.  The send software
seems correct as monitored by the "listen" program.  But the receiver is
working as I expect.

First, I have to call "connect" (in addition to creating and binding the
socket) on the receive socket for anything to be received.  And then it
only receives packets from the socket I "connected" to.  Which makes sense
but I'm confused why I need to "connect" a receive socket?

Second, the packets I do receive are missing the first byte.  The first
byte is cut off.

I'm running kernel 2.4.19-rc2 with libax25-0.0.10.

Any suggestions?

Thanks.

--James

PS...I've hacked up "listen.c" code to do this but that uses SOCK_PACKET.
It would be much cleaner to us DGRAMs but I'm having this reception
issues.


