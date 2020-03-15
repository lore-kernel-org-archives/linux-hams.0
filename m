From: Ivan Savitsky <jcuken321@gmail.com>
Subject: Re: Quesion: AX.25 socket data corruption
Date: Sun, 15 Mar 2020 18:42:45 +0200
Message-ID: <CAJ4MR4bWV4FyiyyUmRLVgn84fq_uTyJRchwHYx2=rmBzL1KhDQ@mail.gmail.com>
References: <CAJ4MR4Z=DQQ=cZoKb=7vS+5nx0u9AhTxjeApsmKW2K2WRx-bhw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=P4lNRbBw/zOfneiN3cCzj1oIP1ruIuUL04TBx8txt44=;
        b=CkTVUx2J+vF+tV6l8jt+fwCmN912r/BadHlY/2kORVkwK+EzKRKmcSaWN/AIl51TBR
         7243OnIo1dCoCFCXZY/YSeQg3b+j5HSiIcVs56bIX1HsF8AeZq4ppXH7302eRyapvaIl
         NUEifmy0bX3c05DSU5009T8T2dMLaOKUmqpO6U2J/PmYnZzsky7yBG6sw5A3VXEY32/g
         EP6F4MRXLr6VBgBdS1bN4xVQrRKm7wc9M+NQR0v+37q1/NT416SJi9MyHnG7ln3C0FUA
         fRFw8qnqYHkK/1E859REFPIJTrsbsXKQh90AMgOrUqUZN2cDrjauuAyUBpbEjVaIbgPS
         JE4A==
In-Reply-To: <CAJ4MR4Z=DQQ=cZoKb=7vS+5nx0u9AhTxjeApsmKW2K2WRx-bhw@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-hams@vger.kernel.org

Now I ran out of ideas while debugging my proxy.c.
It really looks like indeed there is a system buffer corruption during
the write() into SOCK_SEQPACKET socket.

Today I did what I had to do in the first place before anything else =E2=80=
=94
tried something that worked before for years.
I log in into the remote system via AX.25 SVC  by using the 'call'
utility and see if the in/out data is consistent.
What I found: there is a data corruption there as well. I recorded a
short video where hexdump output misalignment
is shown. Here is the YouTube link if anyone interested:
https://youtu.be/K4vhCXLK1b0

With best regards,
Ivan
