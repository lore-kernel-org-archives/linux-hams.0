From: 9a4gl@9a0tcp.ampr.org (Tihomir Heidelberg)
Subject: Re: libax25 axio_flush bug hangs node and fix
Date: Tue, 15 Oct 02 21:58:28 CEST
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <13437@9A0TCP>
References: <3ISZK1A5zFr9Ewiz@skywaves.demon.co.uk>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: your message of 	Tue, 15 Oct 2002 19:22:49 +0100.
             <3ISZK1A5zFr9Ewiz@skywaves.demon.co.uk>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paul@skywaves.demon.co.uk
Cc: linux-hams@vger.kernel.org

Hi

>Internal connections to my Linux_node then onward connection fails.
>Certain conditions the entry in the node user table stays there until I
>kill the associated node process.

it happend when someone connect to node, then execute any external
command (that call any linux command) and then connection get broken

but, because axio_flush enters unlimited loop when one end of pipe die, it
is very possible that this bug produce also hangs of node in different
situations

as I see this loop does not exists in libax25-0.0.9, so I it very
possible that I get this problem after installing libax25-0.0.10

at http://ham2.cc.fer.hr/9a4gl/ax25io.patch is patch you can apply
to libax25-0.0.10 to see if it helps in your situation

of course, then do:
make
make install
ldconfig

73 de Tihomir, 9a4gl@9a0tcp.ampr.org
