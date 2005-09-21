From: Bob Brose <linuxhams@n0qbj-11.ampr.org>
Subject: Re: 2.6.14-rc1 PPC ax25 broken
Date: 21 Sep 2005 04:29:01 -0000
Message-ID: <20050921042901.21387.qmail@kunk.qbjnet.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Ralf Baechle DL5RB said:
> On Sun, Sep 18, 2005 at 08:44:39PM -0000, Bob Brose wrote:
>> As far as I can tell ax25 ip has never worked on 2.6 kernels. I went to

> You're the first to say that.

Sorry, I meant to say ax25 ip has never worked on 2.6 PPC kernels. If I
boot the same PPC machine with a 2.4 kernel with the same kernel Amateur radio
driver setup and the same kissattach everything works fine. It seems to me
that something must have gotten messed up in the transition from 2.4 to 2.6.

>> I'll keep hacking at trying to find the problem however it would help
>> if someone in the know felt like pointing me to the module most likely
>> to be causing the trouble...

> A little odd, in case of PPC I'd at first guess the problem might be
> endianess but there really isn't much of endianess dependant code in the
> whole AX.25.

I think you are right about the problem being endianess related since the
2.6 kernels in intel work and the PPC ones don't. I'm wondering where the
overlap between the PPC working in 2.4 and not in 2.6 and the intel 
working in both points to? It seems that if the AX25 part is working at
least for AX25 connects but not for ip/icmp there should be a fairly 
specific area I should look, probably not mkiss and not kissattach since
it works for 2.4. Seems like it should be in the ax25 code. Maybe it's
a checksum calculation. I just don't know the code that well however
I'll keep on looking...

73, Bob Brose (N0QBJ)
