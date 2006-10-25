From: Robin Kauffman <robin@kauffmanfamily.org>
Subject: Re: Lost password
Date: Wed, 25 Oct 2006 00:24:54 -0700
Message-ID: <1161761094.9240.5.camel@localhost>
References: <7.0.1.0.2.20061024213310.047dde60@sasktel.net>
	 <00F60F1B-58E2-49E9-88F8-E6BE6CF210A5@oz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <00F60F1B-58E2-49E9-88F8-E6BE6CF210A5@oz.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Doug <appld@sasktel.net>, linux-hams@vger.kernel.org

Hi-
	A more secure way to update your root password with a (Live|rescue)CD
is to mount your root partition somewhere, chroot to it and then run
'passwd'.  Of course, this only works if you have one partition for both
your /etc directory and /usr directory.  If not, you can always mount
the respective partitions at their appropriate locations.
	The advantage of this is that your machine never has a blank root
password.

		-Robin K.

On Tue, 2006-10-24 at 20:49 -0700, Bob Nielsen wrote:
> On Oct 24, 2006, at 8:37 PM, Doug wrote:
> 
> > Lost the system password for RH Enterprise 3. User password works
> > just fine but I can't change any files. Is there a way to install
> > a new password? I have tried Red Hats "single user mode", but it
> > went to a kernel panic each time.
> >
> 
> I haven't used RH for about 10 years, but the easiest way to handle  
> that sort of problem (assuming you don't have the ability for a  
> normal user to run root commands with sudo) is to boot with a CD- 
> based distro (such as Knoppix), mount the / directory of the hard  
> drive and edit /etc/password or /etc/shadow (if that  exists) to  
> delete the second field of the root line.  Change
> 
> root:something:something_else  to
> root::something_else
> 
> This will allow root to login without a password.
> 
> Of course, after rebooting to your RH system and logging in as root  
> you should immediately assign a new password with the passwd  
> command.  In addition to using Knoppix or similar, some installation  
> CDs will allow you to mount / and edit the file in the same way (only  
> a limited set of editors may be available, but vi or similar should  
> be there).
> 
> Bob, N7XY
> 
> 
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

