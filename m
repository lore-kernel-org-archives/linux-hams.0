From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: libax25 0.0.11 released
Date: Mon, 17 Mar 2003 21:37:00 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200303172137.00802.vk3bvp@qsl.net>
References: <20030316213344.GA13936@enc.com.au> <002401c2ec69$a719c3c0$14000a0a@p75>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <002401c2ec69$a719c3c0$14000a0a@p75>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Mon, 17 Mar 2003 20:42, Colin Harris wrote:
> With Tommi's update of Node and this update of libax25 ,
> forgive maybe a silly question but how is the best way to
> implement the two changes on an already running system
>  after taking it down of course ). Can I just install over
> the top starting with libax25 and then save my node.conf
> before installing node  0.3.1 in the same way ?
>
> - Regards Colin

I hope the answer is (was) do "make install" while everything is still 
running. Well I'm waiting for my redhat box to crash so I can add a couple 
more serial ports. That was this arvo and packet is still working ok.

I think the sensible answer would be to do up to "make" on both then run your 
ax25 stop script and do "make install" and then restart ax25.

-- 
Shane Deering                   Sent using Kmail v1.4.3
vk3bvp@qsl.net                  on Mandrake Linux, the Desktop OS
vk3bvp@vk3bvp.#sev.vic.aus.oc   MDK9.0 Up 12 hours and 23 minutes 
http://www.qsl.net/vk3bvp/      RH7.2 Up 16 days, 3 minutes 

