From: "J. Lance Cotton" <joe@lightningflash.net>
Subject: axspawn and security on the air
Date: Wed, 28 May 2003 09:38:18 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3ED4C9DA.6070108@lightningflash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,

I am working on setting up an digi-ned based APRS digipeater and I want to 
have ax25d listen for a very restricted set of connections for remote 
administering of the digipeater.

I plan on restricting connections to local-only (no digi-hops) connections 
from authorized admin callsigns. Based on what I read in the AX.25 HOWTO, I 
should use an axspawn command to open up a shell once the connection is made.

The background to my question is this: If I leave the password for an admin 
user blank, some rogue user could easily change their TNC to use an admin 
callsign and wreak havoc. If I require a password for user login, the password 
is transmitted plaintext, right? Same situation as before.

This machine will hopefully, eventually be connected to the Internet, where 
ssh connections are more bandwidth-appropriate, but I want to have the ability 
to remote administer this computer over the air with minimal possibility for 
abuse.

Is insecurity of this type just a given with regard to wireless amateur 
connections?

-Lance
-- 
J. Lance Cotton, KJ5O
http://map.findu.com/kj5o-14
joe@lightningflash.net

