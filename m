From: "Paul R. Tagliamonte" <paultag@gmail.com>
Subject: AX.25 Linux Packet Forwarding
Date: Sun, 27 Mar 2022 20:18:11 -0400
Message-ID: <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=oU5QmbQSK4PQuO1dbj+0TZqeiSG/+1XnTn+GRzyFTeY=;
        b=HfHxP6LbDoe7nrgsjE1Y1iqPNJlN8WmNifLPrZuostYKShS6agQooC6h1Auhl/gsYL
         t1VyDlOrQCQ5DHdH/Ro3Q2OGOkW7KTRiJldkr3B9PWBiDx9xAueWvt4w3dd9F5Cw/PCZ
         Wnqu/Pc7LU8Oxc6KUfkwCcA9qOwK0Z+a7YpulmA4Q1k30E2afaUu3X0r5sUsH8+zJ9Nk
         YHqBCOf8+r3PHuSm4cwrgENz3r0h0RLWUga9IhOmAqSRjkBUGlnnCUKy+ZKDIvhuTuEO
         2esEciDeIF+u6bqoMicHtLwgOodEv8RTm0rcNMWfi4xPswzsr083VBmkipw6B8MiET59
         NObw==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello, Linux HAMs,

I'm just getting into AX.25, and I've not been able to find the right
set of keywords to search for. I've only started learning about this
two days ago, so pointing me to the right docs would be very welcome
and helpful in this case.

I've got a base station and a Kenwood handheld that I've got working
with AX.25. I have a BBS I can hit via my base station, but not my
handheld.

I'd like to set up my Linux box attached to my base station to forward
AX.25 traffic on-frequency as a relay.

HT: "K3XEC-1" (Kenwood)
Base Station: "MYRELAY" (Yaesu)
Remote Station: "MYBBS"

Assuming MYRELAY and MYBBS are valid callsigns / stations -- I'm going
to use these so that we don't get confused by the same callsign but
different SSIDs.

I'd like to be able to (from my Laptop and Kenwood) do (as K3XEC-1):

$ axcall MYBBS via MYRELAY

which would result in MYRELAY sending traffic K3XEC-2>MYBBS, and
relaying traffic back to K3XEC-2 (or something) back via
MYRELAY>K3XEC-1 (or however it should be properly translated - still
not comfortable with the AX.25 framing yet or if there's a convention
there), and have my base-station relay traffic to and from.

Is there something like "net.ipv4.ip_forward" but for AX.25 that would
allow me to do this? Or a daemon or something? I'd love to allow
anyone else nearby to use my base station, so filtering by callsign is
not required here either.

I /think/ I subscribed, but please do keep me on CC in the event I fudged up.

  Paul K3XEC

--
:wq
