From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Linux AX.25 Socket programming
Date: Thu, 2 Jan 2003 06:37:26 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301020617170.1552-100000@oh2bns.ampr.org>
References: <onKLlQBZqzE+EwXZ@mechserv.demon.co.uk>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <onKLlQBZqzE+EwXZ@mechserv.demon.co.uk>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, 1 Jan 2003, Jonathan Naylor wrote:

> Servers that can be started by ax25d do not need to be in C or C++, but 
> can be in Perl, Java, Ruby, COBOL or anything else that can read and 
> write to stdin/stdout.

One word of caution though: AX.25 connections are so called sequential
packet connections which means that packet boundaries have meaning in the
protocol. To make a long story short, this means that you are yourself
responsible for packetizing the data in correct size chunks.

When you read from stdin, you have to pass the read() system call a buffer
that is larger than any incoming packet might be. Otherwise data will be
lost. See for example axconv where read() is always called with a buffer
of 4096 bytes.

When you write to stdout, you need to make sure you don't write() a buffer
longer than the MTU (or PACLEN). Also, you probably want to avoid a
situation where you write() several short buffers in a row as they will be 
sent separately. In axconv I have used the stdio functions for writing 
(and buffering) and used setvbuf() to set the effective paclen.

The above holds for C, and I'm not completely sure how you can accomplish 
the same in eg. Perl. There was a thread about Perl and ax25d recently on 
this list but I have already forgotten what the correct procedure was...

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

