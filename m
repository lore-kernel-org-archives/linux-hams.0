From: Vivi Kusumo <vivi_ksm@yahoo.com>
Subject: Option in kernel compilation
Date: Mon, 9 Sep 2002 06:16:04 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020909131604.45705.qmail@web14401.mail.yahoo.com>
References: <5.1.0.14.0.20020907072816.00aaaec0@pop.freeserve.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5.1.0.14.0.20020907072816.00aaaec0@pop.freeserve.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi all,

I have problem to choose <module> during make xconfig
# cd /usr/src/linux-2.4.19
# make xconfig
--- Amateur Radio support
<*>y  <>-  <>n   Amateur Radio support
--- Packet Radio protocols
<*>y  <>m  <>n   Amateur Radio AX.25 Level 2 protocol
--- AX.25 network device drivers
<>y  <*>m   <>n  Soundcard modem driver
<*>y  <>-  <>n  soundmodem support for Soundblaster
and compatible 
cards
 <>y  <>-  <*>n  soundmodem support for WSS and
Crystal cards
<*>y  <>-  <>n  soundmodem support for 1200 baud AFSK
modulation
 <>y  <>-  <*>n  soundmodem support for 2400 baud AFSK
modulation (7.3728MHz crystal)
 <>y  <>-  <*>n  soundmodem support for 2400 baud AFSK
modulation (8MHz crystal)
 <>y  <>-  <*>n  soundmodem support for 2666 baud AFSK
modulation
 <>y  <>-  <*>n  soundmodem support for 4800 baud
HAPN-1 modulation
 <>y  <>-  <*>n  soundmodem support for 4800 baud PSK
modulation
 <>y  <>-  <*>n  soundmodem support for 9600 baud FSK
G3RUH modulation

I can not choose/click module for "soundmodem support
for Soundblaster and compatible cards" and "soundmodem
support for 1200 baud AFSK modulation". I can only
click yes or no, I don't know why?

Thanks for any help.

Vivi 


__________________________________________________
Do You Yahoo!?
Yahoo! Finance - Get real-time stock quotes
http://finance.yahoo.com
