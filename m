From: "David A. Ranch" <dranch@trinnet.net>
Subject: Fldigi and RTTY decodes
Date: Sat, 05 Sep 2009 18:01:29 -0700
Message-ID: <4AA309E9.3040004@trinnet.net>
References: <9923fd660908310727o354e03dqaf90abe05b4ea800@mail.gmail.com> <1251842807.8971.1.camel@w8iss-desktop> <4A9DA743.9090101@radagast.org> <20090905160400.GH3807@mea-ext.zmailer.org> <4AA2AA78.5000605@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AA2AA78.5000605@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams <linux-hams@vger.kernel.org>

	
Hello Everyone,

I'm a new HAM but not new to Linux.  I've been using Fldigi for
monitoring BPSK31, etc. with good luck but I've been finding that RTTY
rarely works.  It maybe decodes 10% of the time even with a strong
signal.  It also seems the good decodes are specific to a given remote
handle's QSO.

I stumbled upon something today which I bet has a major impact on the
RTTY decoding and I was curious about the group's thoughts.


In researching HF Nets, there is the 3950 Century Club's RTTY NET:

   http://www.3905ccn.com/newsite/netsched.htm

In that URL, it specifies LSB *regardless* of the band and they also
specify specific "mark tones".   In studying for my General ticket, the
current ARRL "General Class License Manual" (section 2-12 & 5-5) mentions:

   - RTTY is usually FSK

   - the ARRL docs *does* mention the existence of AFSK RTTY to use LSB

   - Usual RTTY Mark is at 2125hz and Space at 2295 (170hz diff.)



Now, looking at the Fldigi docs on RTTY, this is where things become
obvious there are issues:

    http://www.w1hkj.com/FldigiHelp/RTTYFSK.html


  - FLdigi's RTTY is "AFSK is not FSK - All of the modem signals that
fldigi produces are audio signals"

  - they mention a Pseudo FSK-RTTY support mode with a external circuit:

   http://www.w1hkj.com/FldigiHelp/PseudoFSK.html

  - "You MUST run the radio is USB to have the correct polarity."  This
conflicts with what the the above Century Net URL and the ARRL docs
specify to use LSB.


So my questions for the net are:

  1. What's more common on the digital bands?  FSK RTTY or AFSK RTTY?
If it's FSK RTTY, are people using TNCs to do RTTY vs. soundcard-based
solutions?

  2. Is there a way to determine if a given RTTY transmission is FSK vs.
AFSK?  I have fairly good ears but maybe it's impossible to hear the
difference with background noise?

  3. Can FLdigi still decode FSK-based RTTY?  Maybe this is only a Tx
limitation?

  4. Maybe Fldigi's RTTY decode (and maybe CW) isn't so hot.  Any
recommendations on alternative Linux packages?  I'd love to hear other
user's thoughts on their favorite Linux apps for HF digital modes (maybe
another email thread).


--David
KI6ZHD
