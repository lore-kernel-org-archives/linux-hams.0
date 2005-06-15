From: David Quental <ct1drb@iol.pt>
Subject: Re: Problems in my ax25 interface.
Date: Wed, 15 Jun 2005 23:01:34 +0100
Message-ID: <200506152301.34300.ct1drb@iol.pt>
References: <200506112158.32378.ct1drb@iol.pt> <200506121205.18849.w.knol@niwa.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200506121205.18849.w.knol@niwa.co.nz>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

Hello all

here still I have problems with my ax25 interface and internet,
I configured my computer to boot without ax25 on, all runs fine (except ax25 
of course) but when I do rcax25 start there are a lot of frames that are 
sending via scc0 (1200 interface).
> Hi David,
>
> > All runs fine, but, lately I added the samba service. Now in my listen
> > (where I can see traffic) I saw a lot of ip frames sending to the 1k2
> > device
>
> You need to stop SAMBA from using the packet network interfaces.
>
> Edit /etc/smb.conf and set
>
> bind interface only = Y
> interfaces = 	eth0, 127.0.0.1
>
> ...assuming eth0 is your LAN interface.
My lan interface is wlan0, I have a wireless lan
> Now restart (as root) smb and nmb with:
>
> rcsmb restart
> rcnmb restart
It does not work, I see this:
len 58 dbcontrol-oms->netbios-ns Data 50 inside tcpip frame.
Maybe this helps.
> Hope this helps...
>
> Wilbert, ZL2BSJ

Best 73s.

CT1DRB
David Quental

