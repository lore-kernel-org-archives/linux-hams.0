From: Rodolfo Brasnarof <rodob@datafull.com>
Subject: Re: Convers Setup
Date: Tue, 26 Oct 2004 13:22:37 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20041026132237.18a4c960.rodob@datafull.com>
References: <417D35BD.9020709@utoronto.ca>
 <200410251818.i9PIIfks003119@yagi.h-net.msu.edu> <417D45FF.5060600@utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <417D45FF.5060600@utoronto.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Mon, 25 Oct 2004 14:29:19 -0400
Dave Stubbs <dave.stubbs@utoronto.ca> wrote:

> I'm looking to *primarily* service AX.25 callers, since this is for
> ARES use.

conversd-saupp can accept ax25 connections by itself, but you need to
loguin with/n your_call. I've setup it listening only on port 3600 tcp,
and ax25 connections are handled by ax25d and axconv, which connects to
de conversd on tcp/ip, logs you automatically, and even can issue some
commands like a /w after connection, all automatically.

> Interesting - the coversd-saupp download links are all broken...

If you still can't download it, I can send it to you.

conversd-saupp.tar.gz  260610 bytes
axconv.c.gz  2563 bytes
