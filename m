From: n7ipb@algedi.wetnet.net (Ken Koster)
Subject: Re: axspawn and security on the air
Date: Wed, 28 May 2003 15:24:47 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3ED5372F.mail9D91CJQTC@algedi.wetnet.net>
References: <3ED4C9DA.6070108@lightningflash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3ED4C9DA.6070108@lightningflash.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org, joe@lightningflash.net

In a previous message, KJ5O says

>I am working on setting up an digi-ned based APRS digipeater and I want to 
>have ax25d listen for a very restricted set of connections for remote 
>administering of the digipeater.
>
>I plan on restricting connections to local-only (no digi-hops) connections 
>from authorized admin callsigns. Based on what I read in the AX.25 HOWTO, I 
>should use an axspawn command to open up a shell once the connection is made.

>The background to my question is this: If I leave the password for an admin 
>user blank, some rogue user could easily change their TNC to use an admin 
>callsign and wreak havoc. If I require a password for user login, the password 
>is transmitted plaintext, right? Same situation as before.

Why bother with axspawn at all?  Since you're making direct connections 
just use SSH, it's not unusable at 1200b, maybe a bit slow but I do it all
the time.

>
>This machine will hopefully, eventually be connected to the Internet, where 
>ssh connections are more bandwidth-appropriate, but I want to have the ability 
>to remote administer this computer over the air with minimal possibility for 
>abuse.

I remote administer five of our local machines with SSH, some at 1200b, some
at 9600b and several hops away.  VI is even usable at 9600, tolerable 
at 1200 :-)


Ken,  N7IPB
