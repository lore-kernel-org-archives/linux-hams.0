From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: AX25 Question
Date: Tue, 18 Mar 2003 10:49:16 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200303181049.16523.vk3bvp@qsl.net>
References: <20030317175956.47AB1290F6@www.fastmail.fm>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030317175956.47AB1290F6@www.fastmail.fm>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Tue, 18 Mar 2003 04:59, Jose A. Amador wrote:
> I have been a long time away from the list.
>
> I would like to know what is the freshest version of ax25 libs, utils and
> tools
> recommended for kernel 2.2.22 with good results.
>
> My attempts to install the freshest stuff failed some time ago and I have
> been
> running an older version by trial and error, but did not try them all.
>
> 73 de Jose, CO2JA
> LinuxUser 91155


I'm running Redhat 7.2 with 2.2.17-21mdk kernel.
I can't seem to remember having problem with the latest versions as they come 
out. I used to compile all the ax25 stuff until I had a major hardware 
failure a few months ago. When I rebuilt that box I gave the RPM's a try (to 
save a heap of time) and they worked like a charm.

These are the main ones I am using -
ax25-apps-0.0.6-1mdk.i586.rpm
ax25-tools-0.0.8-3mdk.i586.rpm
libax25_0-0.0.10-1mdk.i586.rpm
libax25_0-devel-0.0.10-1mdk.i586.rpm
node-0.3.0.tar.gz
And a number of other (less important maybe) packages.

Yesterday I upgraded to these -
node-0.3.1.tar.gz
libax25-0.0.11.tar.gz

I have the same on my Mandrake 9.0 (2.4.19-16mdk kernel) box.

-- 
Shane Deering                   Sent using Kmail v1.4.3
vk3bvp@qsl.net                  on Mandrake Linux, the Desktop OS
vk3bvp@vk3bvp.#sev.vic.aus.oc   MDK9.0 Up 1 hour and 16 minutes 
http://www.qsl.net/vk3bvp/      RH7.2 Up 16 days, 13 hours and 30 minutes 

