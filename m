From: Jeremy Utley <jerutley@gmail.com>
Subject: Re: How do I correct this?
Date: Sun, 28 Nov 2004 05:02:53 -0800
Message-ID: <d5d4185b04112805023fee5fe8@mail.gmail.com>
References: <620c9057041127134410eff0ee@mail.gmail.com>
	 <e524c53204112719084d0b998@mail.gmail.com>
	 <620c9057041127201971f640d9@mail.gmail.com>
Reply-To: Jeremy Utley <jerutley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c9057041127201971f640d9@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

The ax.25 tools use networking functions from the kernel that are
pretty much obsolete.  That's what is generating this message.  If
you're knowledgeable about coding, it might be possible to dig into
the tools source code and fix the issue, but not really worth it.  The
message is harmless, and in fact, the directing of data to /dev/null
as previously suggested will  not do any good, as the message is
coming from the kernel, not the program.

Jeremy, NW7JU


On Sat, 27 Nov 2004 20:19:58 -0800, Chuck Hast <wchast@gmail.com> wrote:
> On Sat, 27 Nov 2004 21:08:11 -0600, Jim Bayer <kc9aop@gmail.com> wrote:
> 
> 
> > You could try directing messages to /dev/null.  For instance:
> >
> > <program-name> 2>&1 >/dev/null
> >
> > This directs stderr to stdout and the whole thing to /dev/null, which
> > is bascially a black hole.  No messages should appear unless there is
> > a call to do direct IO to the screen (which I wold imagine is not done
> > in this case).
> >
> > You will need to edit the rc file (/etc/rc.d or /etc/init.d depending
> > on your linux flavor) and add the redirect there.
> >
> > Good luck.
> >
> >
> >
> >
> > On Sat, 27 Nov 2004 13:44:26 -0800, Chuck Hast <wchast@gmail.com> wrote:
> > > When my machine boots up, I get this message
> > > kissparms uses obsolete (PF_INET,SOCK_PACKET)
> > > I understand that it is not really a problem, but it looks ugly, do I
> > > need to change
> > > the format in which the data is sent to kissparms?
> > >
> > > --
> > > Chuck Hast
> > > To paraphrase my flight instructor;
> > > "the only dumb question is the one you DID NOT ask resulting in my going
> > > out and having to identify your bits and pieces in the midst of torn
> > > and twisted metal."
> > > -
> > > To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> I would rather fix it if possible then just hide it. If there is a fix
> I will try to do
> so, if not I will just disregard it.
> 
> Thank you for the info. I had thought about doing something like that but
> really wanted to correct it.
> 
> --
> 
> 
> Chuck Hast
> To paraphrase my flight instructor;
> "the only dumb question is the one you DID NOT ask resulting in my going
> out and having to identify your bits and pieces in the midst of torn
> and twisted metal."
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
