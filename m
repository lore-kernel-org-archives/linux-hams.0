From: Sriram Chadalavada <swenggsri@yahoo.com>
Subject: MKISS DRIVER PATCH - for layer 3 longword alignment in m68000
Date: Sun, 24 Apr 2005 13:40:43 -0700 (PDT)
Message-ID: <20050424204044.77497.qmail@web21602.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org

 Hi Mr. Albas,
     I am porting AX25 applications/tools to Arcturus
 Networks uCdimm (Motorola MC68VZ328) as part of my
 masters project (www.engr.ku.edu/~kutesat). 
 
 I tried to get TCP/IP applications(uClinux) such as
 FTP, SSH working over an AX.25 link but faced kernel
 panics due to memory alignment issues in the mkiss
 driver, whenever (ICMP, TCP) packets were received
 on the relevant 'kiss' interface.

 In consultation with David McCollough
 (Snapgear/cyberguard.com), I have come up with a
 patch(see attachment) to solve the above problem in
 architectures such as m68000 where alignment issues
 are not handled in hardware. 
 
 The solution lies in increasing skbuf size by 1 and
 aligning the layer 3 header by using
 skb_reserve(skb,1). This approach has been used in
 several ethernet drivers to make them work on these
 architectures.
 
 This change is not yet a part of the mkiss driver
 (2.6.11 kernel). PLease let me know if my patch can
 be incorporated into your driver code. The patched
 driver works on both x86 and m68000.
 
 Kindly reply soon and let me know if you have any
 questions.
 
 Thank you,
 Sriram C.
 (University of Kansas, USA)
 
 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
