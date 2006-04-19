From: Jeremiah <jjgpg@cet.com>
Subject: Re: Broadcasting unwanted UDP messages
Date: Wed, 19 Apr 2006 05:16:15 -0700
Message-ID: <200604190516.16416.jjgpg@cet.com>
References: <4445B27F.5050206@irock.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4445B27F.5050206@irock.com.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Tuesday 18 April 2006 20:46, Ken Moore wrote:
> G'day Folk,
>
> My ax25 system (Debian system with Linpac and Soundcard modem) is
> broadcasting network Samba and Netbios UDP messages.
> Being almost illiterate with Linux could someone point me in the right
> direction to stop this.
> I have checked the files in /etc/ax25/ but nothing seems to relate.
>
> Where should I start looking?

You want to look at /etc/samba/samba.conf. Or what I have done is to use swat. 
I think it is installed with the samba packages, but I'm not sure. (Suse has 
it installed when you install webmin) 
With webmin installed you go to "your-ip":10000 and log in as root. Then go to 
servers, samba, swat. Then when in swat go to global and under base options 
there is "interfaces" you need to set that for the IP of the interface you 
want samba to be on. Then hit commit changes, restart smbd and after that 
samba will only use the interface that has the IP addres that you put into 
that filed. 

There at lest is the GUI way to do it for those who don't like command lines. 
Webmin is a wonderful thing ^_^


Jeremiah
KD7DMP
