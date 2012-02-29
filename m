From: Paula Keezer <paula_ke@yahoo.com>
Subject: Re: [Ubuntu-hams] Contest logging project
Date: Wed, 29 Feb 2012 09:28:33 -0800 (PST)
Message-ID: <1330536513.14841.YahooMailNeo@web120102.mail.ne1.yahoo.com>
References: <20120228232524.GE28180@n0nb.us>
Reply-To: Paula Keezer <paula_ke@yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="-1658718958-1106329241-1330536513=:14841"
Return-path: <bounce-debian-user=gldu-debian-user-2=m.gmane.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1330536514; bh=I2H7McvYfcS56Y4GkbAHPou349YdbXyNZnbIvOmSxoc=; h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type; b=qrWJxC97OBzZM8CGGuMp6Znk4ZieEzBV7M7ZPAJs7c+ns0fMuOGISud55IyyuRTuYh+2Ovpg/Qdnnvk++0skSDXkVS6UBsvaT6PqKfAcxvH0qSLU8pVHBwMcnGrCsUzjk7lBOOkJWIjOgG8FqTctpxvSGEdoA2oyhYijOiZurlI=
In-Reply-To: <20120228232524.GE28180@n0nb.us>
Resent-Message-ID: <6Tyoa--dN5.A.7qF.qQmTPB@liszt>
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:debian-user@lists.debian.org>
List-Help: <mailto:debian-user-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-user-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-user-request@lists.debian.org?subject=unsubscribe>
To: Nate Bargmann <n0nb@n0nb.us>, Debian Users <debian-user@lists.debian.org>, Ubuntu Hams Group <ubuntu-hams@lists.launchpad.net>, Linux Hams <linux-hams@vger.kernel.org>

---1658718958-1106329241-1330536513=:14841
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Nate,=A0 I thought I would share some thoughts with you on the logistics of=
 building a logging program, contest or or otherwise.=A0 =0A=0AAs the autho=
r of the very first windows based logging program back in 1989 (logview, ri=
gview, hamview and packview) I can tell you that developing and keeping a l=
ogging program alive is a daunting task.=A0 I was able to maintain it until=
 1997 when y2k became an issue and the amount of effort for one individual =
to keep up with the changing demands of the community was simply to much.=
=A0 It was written in C and was one of the better offerings for both genera=
l logging and contest logging for its time.=A0 =0A=0A=0AOver the years I've=
 looked at a number of contemporary programs that are feature rich to see i=
f I could contribute and provide some of my expertise gained with 8 years o=
f log program experience.=A0 Unfortunately, they all use rather difficult o=
r under powered development environments.=A0 N1MM for instance, is a dedica=
ted Win platform and to work on that code one would have to make a heavy in=
vestment in the latest win dev platform.=0A=0AI've thought at length about =
how an open source solution might be constructed that could attract a large=
 number of Hamix developers.=A0 As Martin, AA6E pointed out, it would be ve=
ry important to split the effort into two projects:=A0 A frontend project a=
nd a backend project.=A0 Ideally, the frontend project would welcome anyone=
 who wished to make a logging/shackcontrol/cluster user interface to partic=
ipate using the language/development and perhaps even computing platform of=
 their choice.=A0 The backend for logging/dxcc/prefix/callpartial databases=
, rigcontrol/rotatorcontrol/antennaswitch and cluster/telnet/packet/web sho=
uld be in the form of services, preferably communicated=A0 through tcpip so=
ckets or even better, a web api.=A0 Ideally this code should be fast, but i=
f a standard socket or web api were used, it could be built in virtually an=
y language and on top of any db platform and still be compatible.=0A=0AI th=
ink an open source effort like this, where new comers can easily participat=
e and add value to a growing body of code, would be an long term winner.=0A=
=0AI think the challenge is in defining the back end services so that all t=
he features and functions could be easily extended while preserving backwar=
d compatibility and keeping it open so new developers can step in and fill =
in gags as time moves forward.=0AThe front end becomes an open field where =
anyone with a little programming knowledge and access to open source tools =
can build a new look and feel for the community.=0A=0AJust my .02!=0A=0APau=
la, NX1P=0A=0A=0A=0A=0A=0A________________________________=0A From: Nate Ba=
rgmann <n0nb@n0nb.us>=0ATo: Debian Users <debian-user@lists.debian.org>; Ub=
untu Hams Group <ubuntu-hams@lists.launchpad.net>; Linux Hams <linux-hams@v=
ger.kernel.org> =0ASent: Tuesday, February 28, 2012 3:25 PM=0ASubject: [Ubu=
ntu-hams] Contest logging project=0A =0AHi all.=0A=0AI've starting hacking =
on a contest logger.=A0 I am writing it in C++ and=0AwxWidgets and primaril=
y targeting Linux at this time.=A0 I've been working=0Aon this on and off f=
or about six weeks and have reached a point where I=0Aam running up against=
 my inexperience in both C++ and application=0Adevelopment.=0A=0AI am looki=
ng for whomever may be interested in helping to develop this=0Athing into s=
omething that actually works!=A0 I am looking specifically for=0Apersons wi=
th knowledge of C++ and wxWidgets and who are interested in a=0Acontest log=
ger with a logging UI based on the classic CT.=0A=0AMy motivation is to be =
able to use the UI I and many others are=0Acomfortable with.=A0 TR and N1MM=
's ESM UI are just not comfortable to me.=0ABeyond that requirement the onl=
y other requirement is data integrity=0Ausing some sort of database contain=
er.=0A=0AAt this point the program is nothing more than a few windows that =
are a=0Asort of prototype of where I want to go.=A0 The program does not ac=
cept=0Anor store data at this time and such niceties as duping and country=
=0Averification are far off as is rig control, et. al.=0A=0AGiven sufficien=
t interest in the project I will push it up to Github and=0Alook into start=
ing a development mailing list.=A0 At this time it is not=0Auseful so poten=
tial users will be disappointed.=0A=0APlease reply to me direct if interest=
ed.=0A=0A73, de Nate, N=D8NB >>=0A=0A-- =0A=0A"The optimist proclaims that =
we live in the best of all=0Apossible worlds.=A0 The pessimist fears this i=
s true."=0A=0AHam radio, Linux, bikes, and more: http://www.n0nb.us=0A=0A__=
_____________________________________________=0AMailing list: https://launc=
hpad.net/~ubuntu-hams=0APost to=A0 =A0  : ubuntu-hams@lists.launchpad.net=
=0AUnsubscribe : https://launchpad.net/~ubuntu-hams=0AMore help=A0  : https=
://help.launchpad.net/ListHelp
---1658718958-1106329241-1330536513=:14841
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ar=
ial, helvetica, sans-serif;font-size:10pt"><div><span>Nate,&nbsp; I thought=
 I would share some thoughts with you on the logistics of building a loggin=
g program, contest or or otherwise.&nbsp; <br></span></div><div><span>As th=
e author of the very first windows based logging program back in 1989 (logv=
iew, rigview, hamview and packview) I can tell you that developing and keep=
ing a logging program alive is a daunting task.&nbsp; I was able to maintai=
n it until 1997 when y2k became an issue and the amount of effort for one i=
ndividual to keep up with the changing demands of the community was simply =
to much.&nbsp; It was written in C and was one of the better offerings for =
both general logging and contest logging for its time.&nbsp; <br></span></d=
iv><div><br><span></span></div><div><span>Over the years I've looked at a n=
umber of contemporary programs that are feature rich to see if I could
 contribute and provide some of my expertise gained with 8 years of log pro=
gram experience.&nbsp; Unfortunately, they all use rather difficult or unde=
r powered development environments.&nbsp; N1MM for instance, is a dedicated=
 Win platform and to work on that code one would have to make a heavy inves=
tment in the latest win dev platform.</span></div><div><br><span></span></d=
iv><div><span>I've thought at length about how an open source solution migh=
t be constructed that could attract a large number of Hamix developers.&nbs=
p; As Martin, AA6E pointed out, it would be very important to split the eff=
ort into two projects:&nbsp; A frontend project and a backend project.&nbsp=
; Ideally, the frontend project would welcome anyone who wished to make a l=
ogging/shackcontrol/cluster user interface to participate using the languag=
e/development and perhaps even computing platform of their choice.&nbsp; Th=
e backend for logging/dxcc/prefix/callpartial databases,
 rigcontrol/rotatorcontrol/antennaswitch and cluster/telnet/packet/web shou=
ld be in the form of services, preferably communicated&nbsp; through tcpip =
sockets or even better, a web api.&nbsp; Ideally this code should be fast, =
but if a standard socket or web api were used, it could be built in virtual=
ly any language and on top of any db platform and still be compatible.</spa=
n></div><div><br></div><div>I think an open source effort like this, where =
new comers can easily participate and add value to a growing body of code, =
would be an long term winner.</div><div><br></div><div>I think the challeng=
e is in defining the back end services so that all the features and functio=
ns could be easily extended while preserving backward compatibility and kee=
ping it open so new developers can step in and fill in gags as time moves f=
orward.</div><div> The front end becomes an open field where anyone with a =
little programming knowledge and access to open source tools can
 build a new look and feel for the community.</div><div><br></div><div>Just=
 my .02!</div><div><br></div><div>Paula, NX1P</div><div><br></div><div><br>=
</div><div><br><span></span></div><div><span><br></span></div><div style=3D=
"font-family: arial, helvetica, sans-serif; font-size: 10pt;"> <div style=
=3D"font-family: times new roman, new york, times, serif; font-size: 12pt;"=
> <div dir=3D"ltr"> <font size=3D"2" face=3D"Arial"> <hr size=3D"1">  <b><s=
pan style=3D"font-weight:bold;">From:</span></b> Nate Bargmann &lt;n0nb@n0n=
b.us&gt;<br> <b><span style=3D"font-weight: bold;">To:</span></b> Debian Us=
ers &lt;debian-user@lists.debian.org&gt;; Ubuntu Hams Group &lt;ubuntu-hams=
@lists.launchpad.net&gt;; Linux Hams &lt;linux-hams@vger.kernel.org&gt; <br=
> <b><span style=3D"font-weight: bold;">Sent:</span></b> Tuesday, February =
28, 2012 3:25 PM<br> <b><span style=3D"font-weight: bold;">Subject:</span><=
/b> [Ubuntu-hams] Contest logging project<br> </font> </div> <br>=0AHi all.=
<br><br>I've starting hacking on a contest logger.&nbsp; I am writing it in=
 C++ and<br>wxWidgets and primarily targeting Linux at this time.&nbsp; I'v=
e been working<br>on this on and off for about six weeks and have reached a=
 point where I<br>am running up against my inexperience in both C++ and app=
lication<br>development.<br><br>I am looking for whomever may be interested=
 in helping to develop this<br>thing into something that actually works!&nb=
sp; I am looking specifically for<br>persons with knowledge of C++ and wxWi=
dgets and who are interested in a<br>contest logger with a logging UI based=
 on the classic CT.<br><br>My motivation is to be able to use the UI I and =
many others are<br>comfortable with.&nbsp; TR and N1MM's ESM UI are just no=
t comfortable to me.<br>Beyond that requirement the only other requirement =
is data integrity<br>using some sort of database container.<br><br>At this =
point the program is nothing more than a few windows that are
 a<br>sort of prototype of where I want to go.&nbsp; The program does not a=
ccept<br>nor store data at this time and such niceties as duping and countr=
y<br>verification are far off as is rig control, et. al.<br><br>Given suffi=
cient interest in the project I will push it up to Github and<br>look into =
starting a development mailing list.&nbsp; At this time it is not<br>useful=
 so potential users will be disappointed.<br><br>Please reply to me direct =
if interested.<br><br>73, de Nate, N=D8NB &gt;&gt;<br><br>-- <br><br>"The o=
ptimist proclaims that we live in the best of all<br>possible worlds.&nbsp;=
 The pessimist fears this is true."<br><br>Ham radio, Linux, bikes, and mor=
e: <a href=3D"http://www.n0nb.us" target=3D"_blank">http://www.n0nb.us</a><=
br><br>_______________________________________________<br>Mailing list: <a =
href=3D"https://launchpad.net/%7Eubuntu-hams" target=3D"_blank">https://lau=
nchpad.net/~ubuntu-hams</a><br>Post to&nbsp; &nbsp;  : <a
 ymailto=3D"mailto:ubuntu-hams@lists.launchpad.net" href=3D"mailto:ubuntu-h=
ams@lists.launchpad.net">ubuntu-hams@lists.launchpad.net</a><br>Unsubscribe=
 : <a href=3D"https://launchpad.net/%7Eubuntu-hams" target=3D"_blank">https=
://launchpad.net/~ubuntu-hams</a><br>More help&nbsp;  : <a href=3D"https://=
help.launchpad.net/ListHelp" target=3D"_blank">https://help.launchpad.net/L=
istHelp</a><br><br><br> </div> </div>  </div></body></html>
---1658718958-1106329241-1330536513=:14841--

