From: "Demetre Valaris" <sv1uy@sv1uy.ampr.org>
Subject: Protocol error
Date: Sun, 17 Nov 2002 18:29:25 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3DD7E005.25470.636F19D@localhost>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

Hi guys,

Ever since I started using AX25 tools I seem to be getting the foolowing error 
message from the kernel in /var/log/messages.

Nov 17 18:15:21 nest-0 kernel: protocol 0000 is buggy, dev ax0

This message keep repeating quite often.

Now this is probably a warning and it does not seem to cause any problems to 
my AX25 operation. Has anyone seen this messsage in his setup and what does it 
mean please?

I use SUSE 7.3 with 2.4.10-GB kernel and I use the distribution AX25 tools.
On port ax0 I do not use TCP/IP, just AX25 because it is the ax port for my 
APRSD. The funny thing is that I do not get any reports on interface ax1 where 
I use TCP/IP and it has a pk6 link to AMPRnet. I also have to tell you that I 
have assigned an IP address to port ax0 as well, but I do not use any IP on 
ax0.

Any ideas would be much appreciated.

73 de Demetre SV1UY
e-mail sv1uy@sv1uy.ampr.org
http://www.athnet.ampr.org/~sv1uy

