From: Bill - WA7NWP <wa7nwp@jnos.org>
Subject: Re: YAPP File Transfer with Linux
Date: Tue, 12 Jul 2005 15:03:45 -0700
Message-ID: <42D43E41.8060901@jnos.org>
References: <20050712152823.GA17591@oz.net> <Pine.LNX.4.44.0507121202210.19475-100000@srv01.compumont.com> <20050712205148.GA97430@coffee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050712205148.GA97430@coffee>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


> So what you seem to be looking for are tools that send and receive
> files using just AX.25. 'ax25send filename ve3tix' and
> 'ax25receive' running on the listening ("server") side.
> 
> I don't know of anything, but it wouldn't be that hard to write.

Exactly.  Maybe a bit more then that if we have some scripting
to navigate the connections through the nodes and digis.  That
wouldn't even be needed as we might be able to use Expect.

YAPP and the files Curt found might be a good starting place.  Tieing
it through the AX25 system could be a bit tricky.  Also hopefully
it doesn't have any extraneous overhead.

> Maybe if I find some free time.

It would be appreciated.  I'm in a good situation here for a while
with access to a parallel Linux box across town.  That makes it
easy to experiment and test new techniques.

> -ve3tix

Bill
