From: "J. Lance Cotton" <joe@lightningflash.net>
Subject: Re: axspawn and security on the air
Date: Wed, 28 May 2003 10:09:43 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3ED4D137.4020404@lightningflash.net>
References: <3ED4C9DA.6070108@lightningflash.net> <20030528150112.GA19391@leo.tneu.visi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030528150112.GA19391@leo.tneu.visi.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Neu <tim@tneu.visi.com>
Cc: linux-hams@vger.kernel.org

I am not serious enough to worry about the SecurID solution. I guess it's not 
a big deal, since I don't plan on remote adminstering too often.

I would bet my ham license on being able to use encryption for authentication. 
I think the FCC looks more at the spirit of the rules than the exact (and 
ambiguous at times) letter of the rules. So long as you can show that whatever 
you are encrypting (password) carries no information if asked. The problem 
would just be possible abuse (I swear that 16k encrypted chunk of data is my 
password, not an order for 2000 widgets for my company!).

I just recalled using the s/key one-time-password system at school once, so I 
will look into that. It seems to be a good solution: secure and low-bandwidth.

Best regards,
Lance Cotton

Tim Neu wrote:

> On Wed, May 28, 2003 at 09:38:18AM -0500, J. Lance Cotton wrote:
> 
>>Hi,
>>
>>I am working on setting up an digi-ned based APRS digipeater and I want to 
>>have ax25d listen for a very restricted set of connections for remote 
>>administering of the digipeater.
>>
>>I plan on restricting connections to local-only (no digi-hops) connections 
>>from authorized admin callsigns. Based on what I read in the AX.25 HOWTO, I 
>>should use an axspawn command to open up a shell once the connection is 
>>made.
>>
>>The background to my question is this: If I leave the password for an admin 
>>user blank, some rogue user could easily change their TNC to use an admin 
>>callsign and wreak havoc. If I require a password for user login, the 
>>password is transmitted plaintext, right? Same situation as before.
>>
>>This machine will hopefully, eventually be connected to the Internet, where 
>>ssh connections are more bandwidth-appropriate, but I want to have the 
>>ability to remote administer this computer over the air with minimal 
>>possibility for abuse.
>>
>>Is insecurity of this type just a given with regard to wireless amateur 
>>connections?
> 
> 
> How serious are you?  
> 
> You could get something like a SecurID token card, but they would be an expensive solution.   
> (these cards have a number that changes every few seconds, used to authenticate).
> 
> A number of other programs use a math challenge. 
> 
> There may be other ways of using one-time passwords. 
> 
> 
> Some people have also told me that the verbage of the FCC rules does not forbid using encryption for passwords.
> 
> Sec. 97.113 Prohibited transmissions. (a)4 forbids "messages in codes or ciphers intended to obscure the meaning
> thereof".  
> 
> The theories are: 
> a. A password is not a "message". 
> b. Even if it was, it does not have a meaning which could be obscured.   (I wouldn't buy this one, seeing as there is
> obviously a literal meaning being obscured).
> 
> I would say "a" is more sound than "b", but I do not bet my ham license on either.   It would be interesting to get
> feedback from the FCC on this, though.   If they came right out and clarified the situation, I might start using
> encrypted passwords. 
> 

-- 
J. Lance Cotton, KJ5O
http://map.findu.com/kj5o-14
joe@lightningflash.net

