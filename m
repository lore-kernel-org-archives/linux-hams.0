From: Geoff Blake <geoff@palaemon.co.uk>
Subject: Re: Coupling a scope to transmitter output
Date: Sat, 4 Nov 2006 20:56:56 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0611042041580.19275@server.palaemon.co.uk>
References: <20061104201458.8A520D15@teufel.hartford-hwp.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061104201458.8A520D15@teufel.hartford-hwp.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haines Brown <brownh@hartford-hwp.com>
Cc: linux-hams@vger.kernel.org

On Sat, 4 Nov 2006, Haines Brown wrote:

> I have the feeling this question will be a bit OT, and so let me first
> ask to what forum it should have been directed.
>
> I have a Tektronix 2235 I'd like to use to monitor the PSK31 signal
> from a FT-817. I googled a bit and looked in the Handbook, but no
> clue.
>
> The simplest coupling would be a coax T connector between the FT-817
> and the antenna coax, and a length of coax to the scope's External
> Input BNC connector.
>
> This connector is 1 meg-Ohm, 20 mFd, 400 V peak max, about 100 mV/div.
>
> But I have no reason to think this simple coupling would work. Any
> advice?
>
Well, it may work, but it is also an efficient way to damage the
scope input attenuator. The FT817 is perhaps 10W output or about
20V., but after passing through a unknown length of co-ax, then it
could be over quite a wide range of voltages.

If you terminate the connection in 50 ohms, then you will mismatch
the output of the FT817.

There are 'professional' samplers, for that is what you want to
use. They consist of a short length of 50 ohm line, generally a
rigid coaxial line between a pair of UHF, BNC or N connectors and
a third connector fitted to the side of the line. This connector
is inductively coupled or capacitively coupled to the line. You
could make one of these, or perhaps use a BNC T-piece with the
inner of the branch-line removed. what you have then is a
capacitive divider which frequently serves the task well.

HTH

Geoff

-- 
    Geoff Blake G8GNZ      located  near  Chelmsford, Essex, U.K.
    Please reply to:       geoff  (at) palaemon (dot) co (dot) uk
    Using Linux on Intel & Linux or NetBSD on Sun Sparc platforms

    Please  avoid  sending  me  Word  or  PowerPoint attachments.
    See  <http://www.gnu.org/philosophy/no-word-attachments.html>
------------------------------------------------------------------------------

    This  E-mail  and any  attachment(s) are strictly  confidential
    and is intended solely for the addressee(s). If you are not the
    intended recipient please notify <postmaster(at)palaemon.co.uk>
    and the sender by return and permanently delete the message.

    You may not disclose, forward or copy this E-mail or any of its
    attachments to any third party without the prior consent of the
    sender.

------------------------------------------------------------------------------
