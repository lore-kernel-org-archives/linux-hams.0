From: "Jeremy Utley" <jerutley@gmail.com>
Subject: Re: AX.25 for dummies
Date: Tue, 21 Feb 2006 11:24:24 -0800
Message-ID: <d5d4185b0602211124r270ce095led35ce4507ea0dc8@mail.gmail.com>
References: <d5d4185b0602210928t35fb3b38i7d2da67b5c86fc2@mail.gmail.com>
	 <20060221180648.CZXV1818.ibm66aec.bellsouth.net@bigj>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060221180648.CZXV1818.ibm66aec.bellsouth.net@bigj>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jack Sterba <jack@collective.homelinux.net>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On 2/21/06, Jack Sterba <jack@collective.homelinux.net> wrote:

>
> Yes, there are some little quirks with KPC9612's that we fought with to get
> the Orlando FPAC switch working. If needed, I can gladly post the
> appropriate ax25 config files so that you can save yourself some time and
> trouble. Just make sure that your ax25-tools and -apps (0.0.8) and libax25
> (0.0.11) are up to date and it should be pretty easy. BTW, feel free to
> correct me on the versions if I am wrong. Just out of curiosity, what
> distribution of linux are you using?
>
> Jack KB9LEB

Hey Jack -

I've set up AX.25 on Gentoo, Ubuntu Hoary, Slackware, Fedora, Debian,
and LinuxFromScratch systems.  I've set up a regular KAM with both
interfaces (HF and VHF), as well as an older AEA PK-232 with success. 
By far, I think the distro that's the easiest to set up for AX.25 is
Slackware, because you don't fight package managers or odd bootscripts
in getting it working.

I'm surprised the 9612's would give you difficulty, as I thought
setting up both interfaces for them would be just like setting up both
interfaces for the Kam (using BSD PTY's to reference the interfaces
via mkiss).  Now, I do know that SOME distributions which use udev for
device creation will have an older udev that doesn't correctly create
the BSD PTY devices - I had this problem at one time, and I simply
created those device nodes prior to configuring the interfaces via a
mknod command - the commands I used will be in the archives of the
linux-hams list.

Jeremy, NW7JU
