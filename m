From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Trying to get Ax25 running.
Date: Tue, 12 Oct 2004 15:41:45 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <416BDF19.5060902@amsat.org>
References: <620c905704101206324b957deb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c905704101206324b957deb@mail.gmail.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chuck Hast <wchast@gmail.com>, linux-hams@vger.kernel.org

Chuck Hast wrote:
> Folks,
> I am a bit new to this. I am running SuSE 9.1 I have installed the AX25
> stuff, and when I set up the port I have a KISS TNC on I see the commands
> being sent to it.
> When I run call, and it appears that the connection is established the whole
> thing locks up. Not just that screen, but X, Keyboard and all. At that point
> I end up hitting the power button in order to get out of it.

What kernel are you using? 2.4? if so try 2.6.
Try it without X, with any luck you will atleast catch an oops printed 
to the console that could help us further.

Jeroen

