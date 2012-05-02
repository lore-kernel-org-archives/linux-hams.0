From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: Node.js and it's future in debian
Date: Wed, 2 May 2012 15:31:40 -0500
Message-ID: <20120502203140.GA31840@burratino>
References: <CACxjfDH5zYth6Q-ZDLDafqNEczbF3BqaGRcAhsaiPEnApbiUuA@mail.gmail.com>
 <20120501205524.GI30521@flying-gecko.net>
 <20120501215305.GA1250@burratino>
 <20120501221659.GA11430@flying-gecko.net>
 <20120502065003.GB2410@burratino>
 <20120502165031.GC7390@flying-gecko.net>
 <20120502171349.GA23806@burratino>
 <20120502200426.GF7390@flying-gecko.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=WoBjatP6TBOa/nukyfv7zMewJ0820pBgQZ+nVUYUTlA=;
        b=zx160Et7HKOiSd4oIXOOg453ky4Y9bA8JLGL6XB479i0dyskH+6PxuAn33iHcbedL8
         jrnDnxvjGEP1tydUbOZTiDkDD9cMxahmTyUbaAd63u8gr4IrxCwwNtYDPcKfd2GCPJZT
         AmibL4CKredW6M2Omc5MtXCKXkuezozit3mnrTby5ImX497UwbzhZwS62ytMJLF2AlXB
         yWjK2XkUto+qvvxR3R3QuhmcJc6Uk/BQo84hF+GSVo6eOZn2nFVJlSPbA+j+Rx68XG18
         MTkZsF7Z2dcixqZz1O+BhxOhW3VV2uHGqmM103au6m6NfCQGTPWMEhDM+yaPz7AOD1YV
         VDDw==
Content-Disposition: inline
In-Reply-To: <20120502200426.GF7390@flying-gecko.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Ouellette <pouelle@debian.org>
Cc: node@packages.debian.org, nodejs@packages.debian.org, linux-hams@vger.kernel.org

Patrick Ouellette wrote:

>                                   (The "patch" sent does not address
> automatically updating anything)

This is very funny.  You are putting patch in quotes, but it[1] was a
real patch.  It did not automatically update anything because it was
meant to be a simple patch to get work started.  I volunteered to
write further patches once I got feedback on that one, and then I got
no direct feedback on it, just occasional passive-aggressive comments
like the above.

[...]
>> Because you did not ask for one.  Instead you have been wasting time
>> arguing and defending against an opponent you seem to assume is not
>> going to care or listen to you.
>
> The Node.js people apparently didn't ask for one either
> pot - kettle - black

The pot is presumably me.  But I am not a Node.js person.  The Debian
Node.js package maintainers have been friendly and helpful when I
contacted them, and they seem to be willing to help work on including
a nodejs command upstream and modifying Debian packages to use it.
They also seemed willing to remove the node command from nodejs if a
consensus in the project were to develop that that was needed.

Just for completeness, I should mention that Jaime Robles on the
ham radio package maintenance side has been friendly, too.

You have made it clear that you are more interested in punishing
people than in making wheezy better, so I don't think we have anything
left to talk about.  I'll contact the technical committee and leave
this in their capable hands.

Thanks for some useful clarifications,
Jonathan

[1] http://bugs.debian.org/cgi-bin/bugreport.cgi?msg=20;bug=614907
