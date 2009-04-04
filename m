From: "Rick Bolen (GM)" <rickbolgm@gmail.com>
Subject: aprsd not responding to queries
Date: Fri, 03 Apr 2009 20:30:11 -0400
Message-ID: <1238805011.12060.7.camel@fourwinds-lenny.bolenworks.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:content-type
         :date:message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=xS0DktPmwUMT+xec4pDMTc0BKYSDLSLZPT9guDKIT0I=;
        b=s9YzMp6ph+rgBUW2u8j+9CPEhk+0GdZjNr3/eNbOZzJJFo4UwdQkoanF++5Xj62T2y
         O3bo1i6iN8Oilh9PK0YuBFuRkRF2WyG/LWQu9+VpY7tFSl5W+sKakVOodoOQtGIOvfGY
         5sCm8YTvBl/dcmGmaH/frdYmdNzvq8HMh1uog=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I'm trying to query aprsd from xastir message, and I get nothing back
from aprsd.

I've tried

?APRST
?APRST?
?IGATE
?IGATE?
?PING
?PING?

and I've sent to both the mycall (KG4OFO-10) and servercall (KG4OFOsvr)
from my mobile, KG4OFO-1.

I'm needing to ping from a distance to check out routing, but I'm not
getting any response from aprsd from ~20ft.

Thanks,

Rick - KG4OFO 

