From: Nate Bargmann <n0nb@n0nb.us>
Subject: Re: gMFSK ?
Date: Wed, 9 Jul 2008 06:05:58 -0500
Message-ID: <20080709110558.GA4283@n0nb.us>
References: <4873C64E.2000105@mail.tele.dk> <20080708213400.GN8136@n0nb.us> <48744F4A.60705@mail.tele.dk> <courier.4874558A.00001E9A@radagast.org> <48745CDB.8030009@mail.tele.dk> <48749367.8070701@mail.tele.dk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48749367.8070701@mail.tele.dk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

* Erik Jakobsen <erik_ja@mail.tele.dk> [2008 Jul 09 05:33 -0500]:
> Erik Jakobsen wrote:
>
> Hi again..
>
> I installed fldigi and hamlib again, but used the cat from fldigi:
>
> It tells me there's no .xml file in the directory, and this is not correct:
>
> ~/.fldigi> fldigi
> No rig.xml file present
> erikja@erikja:~/.fldigi> ls -l *.xml
> -rw-r--r-- 1 erikja users 3827 2008-07-09 12:27 fldigi_def.xml
> -rw-r--r-- 1 erikja users 4491 2008-07-09 12:27 TS-570.xml
>
> What say ?

Please go to http://groups.yahoo.com/group/linuxham/ and sign up for
that mailing list which is the support list for Fldigi.  There are many
knowledgable members on that list including the Fldigi developers. 
They can really help you.

As one of the Hamlib developers, I'm puzzled why you're having a
problem.  As Dave wrote, it could be an obscure setting.  Looking at
the CVS source for the ts570.c I see that post_write_delay = 30 by
default.  Since I work with Yaseu code, I'm not much help here either.

Sometimes these things can be maddening as a lot of pieces must work
together perfectly.  Don't give up and do just the linuxham group.

HTH,

73, de Nate >>

-- 

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Ham radio, Linux, bikes, and more: http://n0nb.us/index.html
