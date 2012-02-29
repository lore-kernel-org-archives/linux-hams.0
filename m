From: Nate Bargmann <n0nb@n0nb.us>
Subject: Re: [Ubuntu-hams] Contest logging project
Date: Wed, 29 Feb 2012 13:44:02 -0600
Message-ID: <20120229194402.GD8615@n0nb.us>
References: <20120228232524.GE28180@n0nb.us>
 <1330536513.14841.YahooMailNeo@web120102.mail.ne1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-user=gldu-debian-user-2=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <1330536513.14841.YahooMailNeo@web120102.mail.ne1.yahoo.com>
Resent-Message-ID: <yBby4y-m9AK.A.Y4H.6AoTPB@liszt>
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:debian-user@lists.debian.org>
List-Help: <mailto:debian-user-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-user-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-user-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="iso-8859-1"
To: Paula Keezer <paula_ke@yahoo.com>
Cc: Debian Users <debian-user@lists.debian.org>, Ubuntu Hams Group <ubuntu-hams@lists.launchpad.net>, Linux Hams <linux-hams@vger.kernel.org>, Debian Hams <debian-hams@lists.debian.org>

* On 2012 29 Feb 11:30 -0600, Paula Keezer wrote:
> Nate,=A0 I thought I would share some thoughts with you on the logistic=
s
> of building a logging program, contest or or otherwise.=A0=20

Hi Paula.

> As the author of the very first windows based logging program back in
> 1989 (logview, rigview, hamview and packview) I can tell you that
> developing and keeping a logging program alive is a daunting task.=A0 I
> was able to maintain it until 1997 when y2k became an issue and the
> amount of effort for one individual to keep up with the changing
> demands of the community was simply to much.=A0 It was written in C and
> was one of the better offerings for both general logging and contest
> logging for its time.=A0=20

Which is why I'm trying to guage the interest in collaboration before
giving up on this idea completely.

> Over the years I've looked at a number of contemporary programs that
> are feature rich to see if I could contribute and provide some of my
> expertise gained with 8 years of log program experience.=A0
> Unfortunately, they all use rather difficult or under powered
> development environments.=A0 N1MM for instance, is a dedicated Win
> platform and to work on that code one would have to make a heavy
> investment in the latest win dev platform.

IMO, sticking with GNU tools and wxWidgets means the financial barrier
to entry is $0 and each is available for all popular platforms.  Some
may argue that there exists no IDE for Linux.  Perhaps so (although
there are several that make the claim), but I consider my entire desktop
to be the IDE.  ;-)

> I've thought at length about how an open source solution might be
> constructed that could attract a large number of Hamix developers.=A0 A=
s
> Martin, AA6E pointed out, it would be very important to split the
> effort into two projects:=A0 A frontend project and a backend project.=A0
> Ideally, the frontend project would welcome anyone who wished to make
> a logging/shackcontrol/cluster user interface to participate using the
> language/development and perhaps even computing platform of their
> choice.=A0 The backend for logging/dxcc/prefix/callpartial databases,
> rigcontrol/rotatorcontrol/antennaswitch and cluster/telnet/packet/web
> should be in the form of services, preferably communicated=A0 through
> tcpip sockets or even better, a web api.=A0 Ideally this code should be
> fast, but if a standard socket or web api were used, it could be built
> in virtually any language and on top of any db platform and still be
> compatible.

Whew!  Rig control is covered by Hamlib.  But really, I didn't plan for
this project to cover any more ground than CT which I'm most familiar
with.  To me that means maintaining a contest log and nothing more than
Cabrillo and ADIF export (let the other apps deal with LoTW/eQSL
uploads/tracking and the like).  Things like cluster/bandmap support and
multiop stuff is long term.

My idea is to specify contests using a definition file for each event
and from that the program configures the entry/display fields and
scoring.  As I see it, if done smartly the program doesn't need much
rewriting as contest rules change.

> I think an open source effort like this, where new comers can easily
> participate and add value to a growing body of code, would be an long
> term winner.
>=20
> I think the challenge is in defining the back end services so that all
> the features and functions could be easily extended while preserving
> backward compatibility and keeping it open so new developers can step
> in and fill in gags as time moves forward.  The front end becomes an
> open field where anyone with a little programming knowledge and access
> to open source tools can build a new look and feel for the community.

Perhaps I see that as a bit too heavy of a solution?  There have been a
few false starts of something comprehensive on the various ham
radio+Linux mailing lists over the years that have come to nothing.  I'm
looking more in the direction of "do one thing and do it well".

BTW, I now have a mailing list at:

https://lists.sourceforge.net/lists/listinfo/ctestlogger-developer

Later I'll upload my personal Git repository where interested parties
can take a look.  The project page is at:

https://sourceforge.net/projects/ctestlogger/

I chose SourceForge as I'm familiar with it and they offer a Media Wiki
and PHP BB, both of which I've enabled.

Thanks for writing.

73, de Nate >>

--=20

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Ham radio, Linux, bikes, and more: http://www.n0nb.us


--=20
To UNSUBSCRIBE, email to debian-user-REQUEST@lists.debian.org=20
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org
Archive: http://lists.debian.org/20120229194402.GD8615@n0nb.us

