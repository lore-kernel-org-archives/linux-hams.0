From: Chuck Hast <wchast@gmail.com>
Subject: Re: ax25 Listen as a service
Date: Thu, 15 Dec 2005 22:18:17 -0500
Message-ID: <620c90570512151918g52db83bbs21775d2547da100a@mail.gmail.com>
References: <Pine.LNX.4.44.0512141122000.19350-100000@srv01.compumont.com>
	 <43A1BAE9.4000009@jnos.org> <43A1ECE4.1020406@jnos.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43A1ECE4.1020406@jnos.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

On 12/15/05, Bill Vodall WA7NWP <wa7nwp@jnos.org> wrote:
>
> Attention deficit?  Easily distracted.  Couldn't be me....
>
> While playing with the UroNode as a program launched from a socket, it
> dawned on me that it might be possible to do the very same with
> ''listen.''  Often I SSH in to a remote system simply to watch the
> packet activity in the area.  I don't need the shell for that, just the
> listen.
>
> So I gave it a try:
>
> --- in /etc/services ---
>
>    axlisten 3695/tcp  # Linux ax25 listening
>
> --- in /etc/xinetd.conf I added ---
>
> service axlisten
> {
>          socket_type     = stream
>          protocol        = tcp
>          wait            = no
>          user            = root
>          server          = /usr/bin/listen
>          server_args     = -act
> }
>
> ---
>
> Then I sent a -HUP to xinetd and tried it.
>
>    telnet localhost 3695
>
> Wow?  I see packets scrolling by.  Pretty cool!
>
> Now the question for the group.  Is there a better way to do this?  Is
> there anything inherently dangerous with doing this where I'm leaving
> the systems wide open to some exploit?
>

Went to try that port and found this in my services file
bmc-data-coll   3695/tcp   # BMC Data Collection
bmc-data-coll   3695/udp   # BMC Data Collection

Not sure what it is but it is used by something... I have a machine
set up that I ssh to listen and get a listen screen but no one else has
been able to do it on other machines, indeed I have not either, so not
sure what I did that made it work on one machine...???

--
Chuck Hast
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
