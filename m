From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: Regarding XFBB Nightmares!
Date: Thu, 20 Mar 2003 09:59:50 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200303200959.50733.vk3bvp@qsl.net>
References: <3E78A6CA.70604@kj6eo.com>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E78A6CA.70604@kj6eo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Thu, 20 Mar 2003 04:20, Bill Walton wrote:

> install it ie: "rpm -i --test"
> and it failed the dependency "libc.so.5".  I am running RedHat 7.2 with
> a 2.4.20 kernel and
> "libc.so.6".
>
> What would be the easiest way to get around this dependency problem?

Install it. I found libc-5.3.12-31.i386.rpm sitting on my Redhat box and guess 
that's what I used when told by the fbb RPM that it was needed. I can't 
remember if there was a trick involved, but I did manage to get it working.

The following is taken from the description in that RPM.
"Older Linux systems (including all Red Hat Linux releases between 2.0 and 
4.2, inclusive) were based on libc version 5. The libc package includes the 
libc5 libraries and other libraries based on libc5. With these libraries 
installed, old applications which need them will be able to run on your glibc 
(libc version 6) based system. The libc package should be installed so that 
you can run older applications which need libc version 5."

-- 
Shane Deering                   Sent using Kmail v1.4.3
vk3bvp@qsl.net                  on Mandrake Linux, the Desktop OS
vk3bvp@vk3bvp.#sev.vic.aus.oc   MDK9.0 Up 36 minutes 
http://www.qsl.net/vk3bvp/      RH7.2 Up 18 days, 12 hours and 59 minutes 

