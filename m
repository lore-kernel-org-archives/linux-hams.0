From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Incoming AX.25 connections
Date: Sun, 30 Nov 2003 21:11:32 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031130211132.C211@jeroen.pe1rxq.ampr.org>
References: <3FCA4485.6030804@rz-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3FCA4485.6030804@rz-online.de>; from Manfred.Haertel@rz-online.de on Sun, Nov 30, 2003 at 20:27:01 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Manfred Haertel, DB3HM" <Manfred.Haertel@rz-online.de>
Cc: linux-hams@vger.kernel.org

On 2003.11.30 20:27:01 +0100 "Manfred Haertel, DB3HM" wrote:
> If I do not have any AX.25 listener running (no ax25d and no LinKT bound 
> to some SSID on my system) and somebody tries to connect to my system, 
> it seems, that Linux accepts this socket, as it sends an outgoing UA to 
> the incoming SABM.
> 
> On the other hand, as there is no listener, the caller is connected to 
> "nothing" on my system (just to the kernel). I can't talk to him.
> 
> Is this correct?

Yup, this is because the link is protocol agnostic. At the moment of SABM
reception it is not yet known if there is going to be text, ip, netrom or
whatever protocol is going to be used. (Or a combination thereof)
As such the kernel accepts connections to the ax25 address of the
interface.
It is mainly needed for those misguided souls that want to do IP in
connected mode.
 
> If it is, is there any system call to "connect" to the incoming 
> connection afterwards?

No that I now of...

Jeroen

