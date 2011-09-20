From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: conversd-saupp
Date: Tue, 20 Sep 2011 13:29:20 +0200
Message-ID: <20110920112920.GM8243@x-berg.in-berlin.de>
References: <1990DAF0-D2C0-4DFF-89F2-E3099F8A7010@xs4all.nl>
 <alpine.DEB.1.10.1109201006490.25239@nagano.cz>
 <alpine.LNX.2.02.1109201106030.2190@archlinux.home>
 <alpine.LNX.2.02.1109201202440.2190@archlinux.home>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.02.1109201202440.2190@archlinux.home>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Stienstra <b.stienstra@xs4all.nl>
Cc: linux-hams@vger.kernel.org

Hello,

- channel 0:
  conversd.issue is a file which contense is written after connect.
  You may use it to give hints. In the example, it's a notice about
  channel 0.
  Channel 0 usage is not a security issue, but has social reasons.
  We had problems with only a hand full "hams" without any ham spirit.
  Everytime a new OM connected (and for many conversd implementations,
  the default login channel was 0), they began to flame on the newcomer.
  conversd-saupp has many configuration options to handle that social
  disaster:
    - you could configure that channel 0 is not joinable at all
      (conversd.conf: BanZero 1).
    - DefaultChan 1234 (-> user is logged on on channel 1234 - i.E. your
      channel where most local users / sysop team / etc.. are on, being
      able to give hints)
    - DefaultChan 0 configures conversd-saupp to use dice a random channel.

- What to do after a connect?

dl9sau-g> c db0tud-9 db0tud-10
Conn pend
Connected
* convers at db0tud.
* Access to channel 0 has been removed from this server.
*
* Please join with
* /name yourcall channelnumber
*

conversd-saupp does not login the user automaticaly to a channel.
Simply because the user might first try to look if the contact he likes
to chat with is online. Or the sysop likes to check if the links are ok.
I.e., commands like "cstat", "exit", "login", "rtt", and so on are
valid. These are commands to the convers-server which do not introduce
any traffic to other servers.
For a complete list, see 
  $ grep CM_UNKNOWN conversd.c

Another important feature (at least for me) is, that I've the choice
to either
  - use normal text mode, by issuing /name dl9sau 1234
or to enter irc-client mode if I connect with my favourite IRC-client.
conversd-saupp is able to recognize (by the NICK command - which is part
of the IRC-protocol).
    Btw, as a linux user it was very easy for me to script a little daemon
    that listens to localhost:someport and issuing an ax25 connect to a
    convers-server after my local irc-client connects to localhost:someport.

Note that the non-automatical login is not a "new feature", it's a behaviour
conversd had ever since.

It's not conversd-saupp's fault that there are other
convers-implementations around which do an automatical login. With all
the problems it may cause, i.E. that if a neighbor conversd connects
via ax25 for establishing a link, but the configuration of the local
conversd is not correct, the conversd joins to a channel as a normal
user - which is not really a great idea.

vy 73,
	- Thomas  dl9sau

On 2011-09-20 12:08:09 +0200, Ben Stienstra <b.stienstra@xs4all.nl>
wrote in <alpine.LNX.2.02.1109201202440.2190@archlinux.home>:
> 
> One thing i learned is that the message:
> 
>      * Access to channel 0 has been removed from this server.
> 
> Is from the conversd.issue file... So it is not a real error or
> config problem. I can just change the text in the file.
> 
> But i still do not see anything else than that after a connect to
> the AX.25 port. It does not react on any given commands, except for
> /bye! It then disconnects.
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
