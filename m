From: "Chuck Hast" <wchast@gmail.com>
Subject: A issue of permissions?
Date: Mon, 5 Jun 2006 23:45:47 -0400
Message-ID: <620c90570606052045j7da27a40tebfd9446c5798346@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

I am trying to use the netrom function on my FPAC linux box, I know that it
works because others have it working just fine.

I can do FPAC connections from FPACNODE just fine, but when I attempt
to do a netrom connect I get the following message:

KP4DJT-8 (Commands = ?) : c kempc
KP4DJT-8} connect_to: bind: Permission denied

When I look at the syslog I see that the message is coming from fpacnode:

Jun  5 23:41:54 fpac-dev node[22629]: connect_to: bind: Permission denied

From a ps -AL process 22629 belongs to fpacnode:

22629 22629 ttyp0    00:00:00 fpacnode

I have looked at the permissions and all look correct, but perhaps I am
missing something, I see that in the past with LinuxNode there was some
comments about a similar error but never saw what the fix was.

-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
