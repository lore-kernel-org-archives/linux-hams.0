From: Martin Ewing <martin.s.ewing@gmail.com>
Subject: Re: [Ubuntu-hams] Contest logging project
Date: Tue, 28 Feb 2012 18:51:39 -0500
Message-ID: <CAO6+JAY-hbfhrit336u+XJkWy400uBWd6D+kJYY+tNopEAY5Kw@mail.gmail.com>
References: <20120228232524.GE28180@n0nb.us>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=0015174762d685713704ba0ee83f
Return-path: <bounce-debian-user=gldu-debian-user-2=m.gmane.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=BP/YrJMAskNLTz1P01ltVIjcG9xlTX1zrfGE/c1Zh9k=;
        b=Os6O2kTt7ar5Q7/WFnTDIC3/H2kjMKvu5JDhPJl6xhHXc+fWkXIn++1tdyp6pffvmF
         pMjSpHC3ggFvOnpY3zUynbWLuX6QBTTTWadlHqIpZ6ItVo37Xv8kP0wB4OY0F/WtfkZm
         hZVgOaxYStXKPUkYjuG899wuYoFgQNwvP7Zjk=
In-Reply-To: <20120228232524.GE28180@n0nb.us>
Resent-Message-ID: <BYt1LS_f-II.A.9YE.kyWTPB@liszt>
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:debian-user@lists.debian.org>
List-Help: <mailto:debian-user-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-user-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-user-request@lists.debian.org?subject=unsubscribe>
To: Debian Users <debian-user@lists.debian.org>, Ubuntu Hams Group <ubuntu-hams@lists.launchpad.net>, Linux Hams <linux-hams@vger.kernel.org>

--0015174762d685713704ba0ee83f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Nate,

Good luck on this.  If it was me, and I've thought about it from time to
time, I would have done it in Python first. The syntax and high level
aspects are so much easier than C/C++ IMO, and execution speed probably
isn't critical.

It seems that logging is a very personal thing.  I haven't found an ideal
answer for my own needs, but I'm not sure my needs match anyone else's.
This is mainly a front-end issue (GUI, KB interface), while the backend
(db, data exchange, LOTW, what have you) is probably a lot more generic.
Which might suggest a two-part solution that would appeal to a wider
audience?

73
Martin AA6E

On Tue, Feb 28, 2012 at 6:25 PM, Nate Bargmann <n0nb@n0nb.us> wrote:

> Hi all.
>
> I've starting hacking on a contest logger.  I am writing it in C++ and
> wxWidgets and primarily targeting Linux at this time.  I've been working
> on this on and off for about six weeks and have reached a point where I
> am running up against my inexperience in both C++ and application
> development.
>
> I am looking for whomever may be interested in helping to develop this
> thing into something that actually works!  I am looking specifically for
> persons with knowledge of C++ and wxWidgets and who are interested in a
> contest logger with a logging UI based on the classic CT.
>
> My motivation is to be able to use the UI I and many others are
> comfortable with.  TR and N1MM's ESM UI are just not comfortable to me.
> Beyond that requirement the only other requirement is data integrity
> using some sort of database container.
>
> At this point the program is nothing more than a few windows that are a
> sort of prototype of where I want to go.  The program does not accept
> nor store data at this time and such niceties as duping and country
> verification are far off as is rig control, et. al.
>
> Given sufficient interest in the project I will push it up to Github and
> look into starting a development mailing list.  At this time it is not
> useful so potential users will be disappointed.
>
> Please reply to me direct if interested.
>
> 73, de Nate, N=D8NB >>
>
> --
>
> "The optimist proclaims that we live in the best of all
> possible worlds.  The pessimist fears this is true."
>
> Ham radio, Linux, bikes, and more: http://www.n0nb.us
>
> _______________________________________________
> Mailing list: https://launchpad.net/~ubuntu-hams
> Post to     : ubuntu-hams@lists.launchpad.net
> Unsubscribe : https://launchpad.net/~ubuntu-hams
> More help   : https://help.launchpad.net/ListHelp
>



--=20
Martin Ewing
Branford, Connecticut
martin.s.ewing@gmail.com

--0015174762d685713704ba0ee83f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Nate,<br><br>Good luck on this.=A0 If it was me, and I&#39;ve thought about=
 it from time to time, I would have done it in Python first. The syntax and=
 high level aspects are so much easier than C/C++ IMO, and execution speed =
probably isn&#39;t critical.<br>
<br>It seems that logging is a very personal thing.=A0 I haven&#39;t found =
an ideal answer for my own needs, but I&#39;m not sure my needs match anyon=
e else&#39;s.=A0 This is mainly a front-end issue (GUI, KB interface), whil=
e the backend (db, data exchange, LOTW, what have you) is probably a lot mo=
re generic.=A0 Which might suggest a two-part solution that would appeal to=
 a wider audience?<br>
<br>73<br>Martin AA6E<br><br><div class=3D"gmail_quote">On Tue, Feb 28, 201=
2 at 6:25 PM, Nate Bargmann <span dir=3D"ltr">&lt;<a href=3D"mailto:n0nb@n0=
nb.us">n0nb@n0nb.us</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
Hi all.<br>
<br>
I&#39;ve starting hacking on a contest logger. =A0I am writing it in C++ an=
d<br>
wxWidgets and primarily targeting Linux at this time. =A0I&#39;ve been work=
ing<br>
on this on and off for about six weeks and have reached a point where I<br>
am running up against my inexperience in both C++ and application<br>
development.<br>
<br>
I am looking for whomever may be interested in helping to develop this<br>
thing into something that actually works! =A0I am looking specifically for<=
br>
persons with knowledge of C++ and wxWidgets and who are interested in a<br>
contest logger with a logging UI based on the classic CT.<br>
<br>
My motivation is to be able to use the UI I and many others are<br>
comfortable with. =A0TR and N1MM&#39;s ESM UI are just not comfortable to m=
e.<br>
Beyond that requirement the only other requirement is data integrity<br>
using some sort of database container.<br>
<br>
At this point the program is nothing more than a few windows that are a<br>
sort of prototype of where I want to go. =A0The program does not accept<br>
nor store data at this time and such niceties as duping and country<br>
verification are far off as is rig control, et. al.<br>
<br>
Given sufficient interest in the project I will push it up to Github and<br=
>
look into starting a development mailing list. =A0At this time it is not<br=
>
useful so potential users will be disappointed.<br>
<br>
Please reply to me direct if interested.<br>
<br>
73, de Nate, N=D8NB &gt;&gt;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
&quot;The optimist proclaims that we live in the best of all<br>
possible worlds. =A0The pessimist fears this is true.&quot;<br>
<br>
Ham radio, Linux, bikes, and more: <a href=3D"http://www.n0nb.us" target=3D=
"_blank">http://www.n0nb.us</a><br>
<br>
_______________________________________________<br>
Mailing list: <a href=3D"https://launchpad.net/%7Eubuntu-hams" target=3D"_b=
lank">https://launchpad.net/~ubuntu-hams</a><br>
Post to =A0 =A0 : <a href=3D"mailto:ubuntu-hams@lists.launchpad.net">ubuntu=
-hams@lists.launchpad.net</a><br>
Unsubscribe : <a href=3D"https://launchpad.net/%7Eubuntu-hams" target=3D"_b=
lank">https://launchpad.net/~ubuntu-hams</a><br>
More help =A0 : <a href=3D"https://help.launchpad.net/ListHelp" target=3D"_=
blank">https://help.launchpad.net/ListHelp</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br>Martin Ew=
ing<br>Branford, Connecticut<br><a href=3D"mailto:martin.s.ewing@gmail.com"=
 target=3D"_blank">martin.s.ewing@gmail.com</a><br>

--0015174762d685713704ba0ee83f--

