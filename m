From: Arno Verhoeven <linux-hams-list-rcvr@sharon.esrac.ele.tue.nl>
Subject: Re: FBB SMTP
Date: Fri, 23 Jul 2004 09:58:59 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4100C543.8020508@sharon.esrac.ele.tue.nl>
References: <20040719173115.25966.qmail@radagast.org> <01a101c46db9$64d69ba0$050010ac@tokland> <410048DC.9070505@utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <410048DC.9070505@utoronto.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Stubbs <dave.stubbs@utoronto.ca>, linux-hams@vger.kernel.org

Dave Stubbs wrote:

> Hello all,
> 
> I get vague hints from some websites that F6FBB will do SMTP.  However, 
> I can find nothing about this in the documentation or examples.
> 
> Will FBB do this?  Or does it require another app?
> 

As of version 7.04c FBB can accept incoming mail with SMTP, and has the 
capability to serve as a pop3 server.

The CHANGES file in the source tar-ball contains some examples that you 
can put in your configuration files.

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org
