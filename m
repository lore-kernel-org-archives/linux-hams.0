From: Julian Moss <julian.g4ilo@gmail.com>
Subject: Problem with soundmodem on Eee PC
Date: Wed, 9 Sep 2009 23:32:57 +0100
Message-ID: <984e45570909091532n34cb261hd9cdd6f30d448bf7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=7yKt/zQQnxGZBk8o7bEhr3JGkQmX9VTSowG3jTre2Jg=;
        b=cMeVGAhXKz0w0O9XakCtFxJf8kXxKVURhEn75roFAhN/vk/FJWQwUY6rQDApayKobX
         c/KMErarrITzyFvrkMK5yaLM7bkNJ8F8/PbknhwBgE+Yh4Yzy1Do+VXzVXdGjv3wOZmf
         b080u4/HeVERlsKjKMtG5jf+tdixKpghIxMcE=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Is this the right place to ask about the soundmodem AX25 soundcard driver?

I am trying to get APRS running on an Eee PC Surf 2G which has had
Eeebuntu (based on Ubuntu 9.0) installed in place of the original
Xandros.

The version of soundmodem I installed from the repository would not
decode anything. In the diagnostic scope display I saw straight lines
in the trace which you can see in my blog posting here:
http://www.g4ilo.com/2009/09/eee-im-getting-nowhere.html .

I found a posting in a list here
http://osdir.com/ml/linux.hams/2005-10/msg00058.html which suggested
that this is caused by soundmodem opening the sound card at an
unsupported sample rate of 9600. The post included a hack to make it
use 11025.

I downloaded the source code tar.gz from here
http://www.baycom.org/~tom/ham/soundmodem/ and compiled it. I noticed
that the diagnostic scope display in my version froze after a couple
of seconds. I applied the changes given in the above posting, though I
noted that the line numbers in the config app code were slightly
different from those given.

Although the diagnostic is unusable the modified soundmodem itself
seemed to work and decodes APRS received from my radio. However I have
noticed that after some fairly short period of time, perhaps an hour
or so, nothing is decoded and I have to restart the computer to get it
going again. This obviously makes it unusable in practise.

I am at a loss what to try next, since the source code is too complex
for me to try to debug it. Has anyone got this working reliably on an
Eee PC?
-- 
Julian, G4ILO
G4ILO's Shack: www.g4ilo.com
