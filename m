From: Frank Smith <frankiansmith@gmail.com>
Subject: soundmodem on OpenWRT on ASUS WL-520gU router with USB audio
Date: Sat, 26 Sep 2009 09:13:23 -0300
Message-ID: <e741d6300909260513g4a6f29bal9cc2484e7c52159d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=CLzssNmPQ7FKuusAr3cIyTFJOKtfeAzgCWJAAZn0IH0=;
        b=sL+ZO3rywc4tw1IQTwH6Hd949Aj0PHhV6EXHNt2xDSSWNEXB/t4EotLb/6XY3tOdx+
         8EJqmDZvmKaFboAztdfZRteHPyiwyWpiirYPpaUmFHkXJsL6Qdl20Bkz2wBPxUl7PQpO
         l3UichPIFidcOoSoQ5wv+zAJWEG+Hpdxuwmto=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello,

I have recently been working on getting soundmodem running on OpenWRT
on an ASUS WL-520gU router with a USB audio dongle. I have had some
initial success so I thought I would make the magic available to
anyone who is interested.

I have posted the software and a rudimentary set of installation
instructions at http://www.ve1fis.net, follow the link to
"Frankenrouter-2". These instructions assume a working knowledge of
OpenWRT and AX.25 on Linux.

It is just a proof of concept at this point; I have successfully used
it for a couple of days to monitor APRS traffic (using the axlisten
command) and send APRS beacons (using the beacon command). After you
install the packages it is up to you to make it do something. On my
router there is about 500k of flash available after installation.

This soundmodem package differs from vanilla soundmodem in a couple of ways:
- I patched in a lightweight xml parser
(http://ezxml.sourceforge.net/) to avoid requiring libxml2
- There is no configuration application; you need to create your own
soundmodem.conf

I welcome any suggestions for improvements, and please let me know if
you find this useful. I think this would be a great platform for
ldsped (http://www.on7lds.net/ldsped/index.html) once it is released
in source code.

Frank VE1FIS
