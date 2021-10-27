From: thomas@habets.se
Subject: Is there a spec for the AX.25 reserved bit being used for AX25_EXTSEQ?
Date: Wed, 27 Oct 2021 06:23:51 -0700
Message-ID: <CA+kHd+eunGfNi+mufRe8e3=q+uRt+zz_MeREohORFXctTQv23Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=habets.se; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=VldE9v/70E5InsJ+qt74k4bkvSq+51WUMJQK0Xbod5Q=;
        b=gNwk1EDlkNgTo480GbbHlj+3zuKRxzCjNtHEURWOSMjpO+oTZZ0wIkWxho/iBt5Au0
         gQxvwpC3cR9B2Qj2y2wy3uji5G9WxLy/DO5rKR73t48YliA3rpJC51z6s+Lym1XT2vz6
         kENI7aAoRNQh6bqhRn7b8XDgng/yutsk6MBPU=
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi.

I noticed that when AX25_EXTSEQ is used, Linux clears one of the
reserved bits in the destination address.

In the AX.25 2.2 spec[1] these are just marked as reserved. Linux
seems to use one to indicate extended sequence number.

This makes sense, since it allows decoding of I frames without first
having seen the SABME frame. (SABME being the indicator that sequence
numbers are 7 bits instead of 3, as opposed to SABM)

Question: Is there a spec for this use of the (by spec 2.2) reserved bit?

The git repo doesn't have history far enough to comment on when this
code was written, but it's been this way since Linux 1.3.14 introduced
AX25_EXTSEQ back in June 1995. lkml.org doesn't even have archives
that far back.

axlisten (from ax25-apps) uses the bit this way since git history
start, "Import ax25-apps 0.0.1 from tarball" in 1999.

[1] http://www.tapr.org/pdf/AX25.2.2.pdf

--
typedef struct me_s {
  char name[]      = { "Thomas Habets" };
  char email[]     = { "thomas@habets.se" };
  char kernel[]    = { "Linux" };
  char *pgpKey[]   = { "http://www.habets.pp.se/pubkey.txt" };
  char pgp[] = { "9907 8698 8A24 F52F 1C2E  87F6 39A4 9EEA 460A 0169" };
  char coolcmd[]   = { "echo '. ./_&. ./_'>_;. ./_" };
} me_t;
