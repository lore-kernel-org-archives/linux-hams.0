From: Tim Neu <tim@tneu.visi.com>
Subject: Re: axspawn and security on the air
Date: Wed, 28 May 2003 10:01:12 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030528150112.GA19391@leo.tneu.visi.com>
References: <3ED4C9DA.6070108@lightningflash.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3ED4C9DA.6070108@lightningflash.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Lance Cotton" <joe@lightningflash.net>
Cc: linux-hams@vger.kernel.org

On Wed, May 28, 2003 at 09:38:18AM -0500, J. Lance Cotton wrote:
> Hi,
> 
> I am working on setting up an digi-ned based APRS digipeater and I want to 
> have ax25d listen for a very restricted set of connections for remote 
> administering of the digipeater.
> 
> I plan on restricting connections to local-only (no digi-hops) connections 
> from authorized admin callsigns. Based on what I read in the AX.25 HOWTO, I 
> should use an axspawn command to open up a shell once the connection is 
> made.
> 
> The background to my question is this: If I leave the password for an admin 
> user blank, some rogue user could easily change their TNC to use an admin 
> callsign and wreak havoc. If I require a password for user login, the 
> password is transmitted plaintext, right? Same situation as before.
> 
> This machine will hopefully, eventually be connected to the Internet, where 
> ssh connections are more bandwidth-appropriate, but I want to have the 
> ability to remote administer this computer over the air with minimal 
> possibility for abuse.
> 
> Is insecurity of this type just a given with regard to wireless amateur 
> connections?

How serious are you?  

You could get something like a SecurID token card, but they would be an expensive solution.   
(these cards have a number that changes every few seconds, used to authenticate).

A number of other programs use a math challenge. 

There may be other ways of using one-time passwords. 


Some people have also told me that the verbage of the FCC rules does not forbid using encryption for passwords.

Sec. 97.113 Prohibited transmissions. (a)4 forbids "messages in codes or ciphers intended to obscure the meaning
thereof".  

The theories are: 
a. A password is not a "message". 
b. Even if it was, it does not have a meaning which could be obscured.   (I wouldn't buy this one, seeing as there is
obviously a literal meaning being obscured).

I would say "a" is more sound than "b", but I do not bet my ham license on either.   It would be interesting to get
feedback from the FCC on this, though.   If they came right out and clarified the situation, I might start using
encrypted passwords. 

-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
______         _ __                          Military Intelligence
  /           ' )  )        -KC0LQL-         Honest Politician
 / o ______    /  / _  . .                   Intellectual Property  
/ <_/ / / <   /  (_</_(_/_  -- tneu@visi.com / http://www.visi.com/~tneu --
