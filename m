From: don <don_reid@comcast.net>
Subject: Re: Anybody using SignaLink from Tigertronics?
Date: Mon, 15 Sep 2008 07:51:29 -0700
Message-ID: <20080915145129.GA18070@reid1>
References: <48CE54C0.4000203@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48CE54C0.4000203@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bent Bagger <bbagger@gmail.com>
Cc: Linux Hams Mailing list <linux-hams@vger.kernel.org>

On Mon, Sep 15, 2008 at 02:27:44PM +0200, Bent Bagger wrote:
> Hi List
>
>
> I would like to hear about any experience you may have had with the 
> SignaLink USB PC-to-radio interface box. Briefly, SignaLink USB is box with 
> a sound card plus additional circuitry for e.g. PTT. The PC interface is 
> USB. See http://tigertronics.com/

I liked it so much I bought a second one, one for my VHF setup and one
for HF.  They worked very well with soundmodem and fldigi on Ubuntu 7.

I have upgraded to Ubuntu 8, and cannot get soundmodem to work, but 
fldigi still works great.  I suspect that there is something new
in the sound services in 8 that soundmodem isn't working with.
(If anybody knows how to make this work, please tell me.)

The Signalink has an empty IC socket inside into which you insert
jumpers to adapt the connections to your radio, (or you can make your
own cable).

It uses VOX to trigger the PTT, which the HFLINK folks say isn't fast
enough for the rapid scanning that their system does.

-- 
Don - W7DMR
