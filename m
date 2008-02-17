From: walter harms <WHarms@bfs.de>
Subject: Re: Help pppd
Date: Sun, 17 Feb 2008 16:20:34 +0100
Message-ID: <47B850C2.7080705@bfs.de>
References: <000a01c87086$f4f98160$98cc10ac@tower>
Reply-To: WHarms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000a01c87086$f4f98160$98cc10ac@tower>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pino Zollo <pinozollo@gmail.com>
Cc: Linux Hams <linux-hams@vger.kernel.org>



Pino Zollo wrote:
> Please can somebody help me in configuring Gnome ppp on Debian 4.0r1 ?
> 
> I connec to trough a cellular phone on USB.
> It connects and for 2 minutes I can even log to a DX Cluster, then pppd dies
> with error 15:
> "Lack of LCP responses"
> 
> I have tryed some changes in the config file in /etc/ppp but no result.
> 
> Haw can I convince pppd to stay alive ?


    15     The link was terminated because the peer is  not  responding  to
              echo requests.


i guess you server had closed the connection/died.

if you can connect propperly to a public internet modem i guess the server side has a problem.

re,
 wh

