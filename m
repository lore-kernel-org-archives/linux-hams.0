From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Lost password
Date: Tue, 24 Oct 2006 20:49:29 -0700
Message-ID: <00F60F1B-58E2-49E9-88F8-E6BE6CF210A5@oz.net>
References: <7.0.1.0.2.20061024213310.047dde60@sasktel.net>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <7.0.1.0.2.20061024213310.047dde60@sasktel.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Doug <appld@sasktel.net>, linux-hams@vger.kernel.org


On Oct 24, 2006, at 8:37 PM, Doug wrote:

> Lost the system password for RH Enterprise 3. User password works
> just fine but I can't change any files. Is there a way to install
> a new password? I have tried Red Hats "single user mode", but it
> went to a kernel panic each time.
>

I haven't used RH for about 10 years, but the easiest way to handle  
that sort of problem (assuming you don't have the ability for a  
normal user to run root commands with sudo) is to boot with a CD- 
based distro (such as Knoppix), mount the / directory of the hard  
drive and edit /etc/password or /etc/shadow (if that  exists) to  
delete the second field of the root line.  Change

root:something:something_else  to
root::something_else

This will allow root to login without a password.

Of course, after rebooting to your RH system and logging in as root  
you should immediately assign a new password with the passwd  
command.  In addition to using Knoppix or similar, some installation  
CDs will allow you to mount / and edit the file in the same way (only  
a limited set of editors may be available, but vi or similar should  
be there).

Bob, N7XY





