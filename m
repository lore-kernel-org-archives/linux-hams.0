From: f6bvp <f6bvp@free.fr>
Subject: Re: Fwd: Re: New Debian ax25-tools update broke mkiss utility
Date: Thu, 19 Oct 2017 00:07:21 +0200
Message-ID: <6df16699-c195-b4a7-d13f-d5d9a3f4ae17@free.fr>
References: <87581d3d-a63c-d9ef-13fd-857745d79da6@trinnet.net>
 <768bffac-bdc8-a43d-39dc-5c8586a1062d@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <768bffac-bdc8-a43d-39dc-5c8586a1062d@trinnet.net>
Content-Language: en-US
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: David Ranch <dranch@trinnet.net>
Cc: linux-hams@vger.kernel.org

Hi David,

I cloned git Ralf's official AX.25 repository and could compile and 
install libax25, ax25-tools and ax25-apps.

Sources are in http://git.linux-ax25.org/cgit/

and the wiki site (http://www.linux-ax25.org/wiki/GIT) explains how to 
clone the directories (for example):

    git clonegit://git.linux-ax25.org/pub/scm/libax25

Then, in order to compile sources and perform installation, I found on 
http://www.linux-ax25.org/wiki/Compilation a bootstrap that did the job.

for dir in libax25 ax25-apps ax25-tools; do
   cd $dir && autoreconf --install --force && \
     ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man && \
     make && make install && cd ..
done

There are a few warnings about missing things during ./configure process 
and by default install is not performed on /usr/local dirs.

One should edit the above script accordingly in order to get binaries 
installed in more convenient /usr/local dirs.

Then I installed FPAC and LinFBB applications and they seem to run, 
although things need some more testing.

I will report about it later.

Bernard, f6bvp


Le 14/10/2017 à 01:18, David Ranch a écrit :
>
> Hey Bernard,
>
> I'm curious on your thoughts of moving back to the Official AX25 
> sources.  I do know that Ralf and Thomas have been doing a lot of work 
> on their code base yet Lee VE7FET's repo hasn't received any updates 
> in at least 2 years.  Maybe you can do some testing with these udated 
> sources with FBB, FPAC, and ROSE and see if things are OK?
>
> --David
>

