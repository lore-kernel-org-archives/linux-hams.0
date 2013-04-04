From: =?ISO-8859-1?Q?Marc_Mar=ED?= <5.markmb.5@gmail.com>
Subject: New on this
Date: Fri, 5 Apr 2013 00:03:55 +0200
Message-ID: <CA+nFU8R=vmrap7TR8mU3HpqoLiErwYM4yCRZ2rKMexDpnAqNHg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=0ctvhO22UqzpfUDzwrGORBAbvHIbU+DUux52Bw5ogaA=;
        b=oaBzjJBJk2NEm7PYPVQ406rI91MyhQxRCaApm3EJYlC2Z8RotPlD1jU+G0eOqAqbX0
         XtkI17U6yIeCaRJnZYzewtlzoQdKgWT3/aIp5z/jQfWZO8ZAn+V/zHwOnUzerLmFINMU
         feBjMScCemycMdB6YyFXHCJClNXMpwiGiy2+YXCEudE7lO7b8zlwOCbivuE0HdpUvyN8
         paGk0EL6gaMaKgq3NMexUTlW2YF3x4GEQyHGjYahufa1G1L48xBojmPRYih01+mOHJVG
         nMxiqSH4qvINGspkcCXTweejK5jkAE0AeHYAlVmIh1YjEfHeT3uVXLCTFeYoYa0cm5yM
         d1wg==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Some friends and I are trying to develop an application using AX.25
encoding, but not in standard situation.

It is intended to not use a TNC, and do everything by software, except
the transceiver itself, and by now, the transceiver can send data (not
AX.25, but plain data)

So now, we want to implement AX.25, so we can communicate with a
reciver which uses a TNC31. We've been looking a lot of documentation,
but we have not been able to determine what part of all the package
work will have to be done by hand.

We didn't configure AX25 yet, but we have the thought that what AX25

So, we will have to do by hand the data whitening and scrambling
needed for the TNC?

will return will be the data with the headers and CRC encapsulated in
KISS. Is that true?
Do you know any way to simplify all the process for a all-software transmission?

We are all a bit lost, and a bit of help would be very appreciated

Thank you in advance!
