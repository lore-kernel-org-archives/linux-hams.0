From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: ax25 Listen as a service
Date: Thu, 15 Dec 2005 14:23:32 -0800
Message-ID: <43A1ECE4.1020406@jnos.org>
References: <Pine.LNX.4.44.0512141122000.19350-100000@srv01.compumont.com> <43A1BAE9.4000009@jnos.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43A1BAE9.4000009@jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Attention deficit?  Easily distracted.  Couldn't be me....

While playing with the UroNode as a program launched from a socket, it 
dawned on me that it might be possible to do the very same with 
''listen.''  Often I SSH in to a remote system simply to watch the 
packet activity in the area.  I don't need the shell for that, just the 
listen.

So I gave it a try:

--- in /etc/services ---

   axlisten 3695/tcp  # Linux ax25 listening

--- in /etc/xinetd.conf I added ---

service axlisten
{
         socket_type     = stream
         protocol        = tcp
         wait            = no
         user            = root
         server          = /usr/bin/listen
         server_args     = -act
}

---

Then I sent a -HUP to xinetd and tried it.

   telnet localhost 3695

Wow?  I see packets scrolling by.  Pretty cool!

Now the question for the group.  Is there a better way to do this?  Is 
there anything inherently dangerous with doing this where I'm leaving 
the systems wide open to some exploit?

Thanks,
Bill - WA7NWP
