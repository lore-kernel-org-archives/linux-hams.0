From: "Douglas Cole" <doug.n7bfs@gmail.com>
Subject: Re: [ANN] Hamlib 1.2.5 released
Date: Tue, 28 Feb 2006 16:03:03 -0800
Message-ID: <9923fd660602281603l24acbb0dqdad4d2899a3ac734@mail.gmail.com>
References: <4403823C.2090603@yahoo.es>
	 <9923fd660602280739j7feda442ofb1315bf5d748bc9@mail.gmail.com>
	 <20060228210401.GA12763@flying-gecko.net> <4404D447.2050609@yahoo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4404D447.2050609@yahoo.es>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ricardo Saiz Villoria <rsaizv@yahoo.es>
Cc: Linux HAMs <linux-hams@vger.kernel.org>

On 2/28/06, Ricardo Saiz Villoria <rsaizv@yahoo.es> wrote:
>
>
> Patrick A. Ouellette wrote:
> > At the risk of sounding low tech, you could use a telnet/ssh session to
> > the remote PC and run rigctl to change settings.  Not the flashy
> > monitoring of grig or an ncurses interface, but it would get the job
> > done.
> >
> > You still have to get the audio to and from the radio....
> >
> > 73,
> >
> > Pat KB8PYM
>
> It is easier than that: the hamlib can talk to grig by rpc via udp
> packets across a network. So the required network bandwidth is close to
> that of the rs232 link.
>
> You can control your rig in these ways:
>
> rigctl   : with commands
> grig     : graphically; grig calls rigctl in the background
> rpc.rigd : the daemon stays listening for udp packets
> followed by:
> grig -m 1901 -r <host>    : grig in local or remote machine
> or:
> rigctl -m 1901 -r <host>  : command line in local or remote machine

So if I understand your input correctly Ricardo, as long as my network
can pass the udp along then I could have grig running on my local
desktop pc talking to a remote pc running rigctl and I could control
my FT100d via this type of control you show above?
And I could control PTT that way as well?
I guess I need to do some more reading, because I am still trying to
wrap my head around making that work, but I guess I need to piece it
all together and see if it will play.

This would be very good, then it would just be a matter of streaming
audio both ways when needed, I will look into ophone for that part...

Thanks very much for the ideas, this may come to some useable end
after all, if I can just glue it all together in some useable form :)

73
--
Doug
N7BFS
