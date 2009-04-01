From: "Rick Bolen \(GM\)" <rickbolgm@gmail.com>
Subject: how to gracefully exit aprsd server port connection?
Date: Wed, 1 Apr 2009 13:23:48 -0500
Message-ID: <024001c9b2f7$00f80410$2401a8c0@fourwinds>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to:subject
         :date:mime-version:content-type:content-transfer-encoding:x-priority
         :x-msmail-priority:x-mailer:x-mimeole;
        bh=JOJ+r7Ow4nuRemjt/mWckAExNBTv+T8hcmiyB3KQS0Y=;
        b=U37tHt1qrbWCFQUweE0LsgOWNNxPvZENP7QKNJdvvlTfRwPTkVemYazWUOHSuMw2OU
         Dyjet7Sk6Cj7eERAFvBAHaBEVA4lmMJ9APAtvUuehG31CkBVULUwNUSumhsYsm43zDrO
         nnLV2zzQZOf/cgpJoaNOdhqoon5jHXQBdrp60=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello,

I have a perl script that connects to an APRSd server port (#14579 - TNC
data only) and displays it to the console. The feed instructions state
to hit "ctrl-D" to exit.

This does not work for me. Nothing happens. If I hit "ctrl-C" from the 
console running my script, it kills the entire aprsd process!

How do I gracefully close my socket connection without taking out the
whole process?

Thanks,

Rick - KG4OFO

