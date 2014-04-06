From: David Ranch <linux-hams@trinnet.net>
Subject: Re: AX25 Node problem - please help
Date: Sun, 06 Apr 2014 12:41:04 -0700
Message-ID: <5341ADD0.2050303@trinnet.net>
References: <53412F05.4090306@mybunker.plus.com> <53419279.3090804@mybunker.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <53419279.3090804@mybunker.plus.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Roger,


> It would appear to be a known problem. Brian N1URO has fixed it in 
> URONode but I believe that it's still a problem in the original node.
>
> Anyone who notices the node going into a loop and using unnecessary 
> resources should consider using URONode instead.

Though I too recommend UroNode, could you tell us more about what you're 
seeing in this "looping" issue with LinuxNode?  If it's a real bug, we 
should try to get it fixed as that software is still commonly used and 
available in various Linux distributions:

    Ubuntu: http://packages.ubuntu.com/lucid/hamradio/node
    Fedora: http://koji.fedoraproject.org/koji/packageinfo?packageID=6606
    Debian: https://packages.debian.org/stable/hamradio/node
    etc

yet UroNode is *not* included in most distribution packages per the 
request of the developer.

--David
KI6ZHD
