From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: CONVERS Primary server
Date: Thu, 16 Feb 2006 22:07:05 -0800
Message-ID: <43F56809.7090501@jnos.org>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca>  <d5d4185b0601291929r3193867nd1e8292455427be2@mail.gmail.com>  <Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org> <1138629532.7628.2.camel@CO> <43DE5851.33E01B71@free.fr> <43DE7B4B.5040509@jnos.org> <Pine.SUN.4.58.0601301303330.7020@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0601301303330.7020@eskimo.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


I'm setting up a couple CONVERS nodes.  Everything is going good but I'm 
a bit confused with the comments in the CONF file.

===
# Link:
#
# Parameters:   <Remote_host>   <remote_address:port>   [primary_link]
Link            Chicpe          irc.n1uro.ampr.org:3600
Link            SpamNet-1       eth1.mara.org:3600      Chicpe
# Link          Kuopio_Fl       blues.pspt.fi:3600      SpamNet-1
# Link          USAHub          199.0.154.23:3600       Kuopio_Fl
#
# In the above example, Kuopio_FI is your primary link, Stockholm is
# a backup for Kuopio_FI, and Foobar is a backup for Stockholm. conversd
# will try to keep connected with Kuopio_FI, and use Stockholm and
# Foobar as backups in the listed order of preferrence.
===

Is this saying that Chicpe is the local primary link and the primary 
link also by SpamNet.   Or is the primary link OF Chicpe SpamNet-1 and 
thus it'll be the local backup?

Are these hosts still valid?

Thanks,
Bill - WA7NWP


