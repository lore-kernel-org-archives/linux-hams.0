From: Erik Jakobsen <erik_ja@mail.tele.dk>
Subject: Re: gMFSK ?
Date: Wed, 09 Jul 2008 16:37:32 +0200
Message-ID: <4874CD2C.3060905@mail.tele.dk>
References: <4873C64E.2000105@mail.tele.dk> <20080708213400.GN8136@n0nb.us> <48744F4A.60705@mail.tele.dk> <courier.4874558A.00001E9A@radagast.org> <48745CDB.8030009@mail.tele.dk> <48749367.8070701@mail.tele.dk> <20080709110558.GA4283@n0nb.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080709110558.GA4283@n0nb.us>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Nate Bargmann wrote:
>
>
> Please go to http://groups.yahoo.com/group/linuxham/ and sign up for
> that mailing list which is the support list for Fldigi.  There are many
> knowledgable members on that list including the Fldigi developers. 
> They can really help you.
>
> As one of the Hamlib developers, I'm puzzled why you're having a
> problem.  As Dave wrote, it could be an obscure setting.  Looking at
> the CVS source for the ts570.c I see that post_write_delay = 30 by
> default.  Since I work with Yaseu code, I'm not much help here either.
>
> Sometimes these things can be maddening as a lot of pieces must work
> together perfectly.  Don't give up and do just the linuxham group.
>
> HTH,
>
> 73, de Nate >>
>
>   
I'm now a member of the group.

I have been inside the ts570.c too, and have edit the value to 50.
But at that time I had not in mind, that I have installed openSUSE11.0.
I used 10.3 before, and haven't installed th4e gcc :-(
I will try to compile make make install again.
Tnx Nate

73,
Erik, OZ4KK
