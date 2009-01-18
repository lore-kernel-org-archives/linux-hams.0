From: Ken Koster <n7ipb@wetnet.net>
Subject: Re: Problems with ax25d/axspawn on OpenSuSE 11.0 32-bit
Date: Sun, 18 Jan 2009 13:08:18 -0800
Message-ID: <200901181308.20407.n7ipb@wetnet.net>
References: <alpine.LNX.1.10.0901172222000.22616@wapiti2.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0901172222000.22616@wapiti2.we7u.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Curt, WE7U" <archer@eskimo.com>
Cc: linux-hams@vger.kernel.org

On Sunday 18 January 2009, Curt, WE7U wrote:
...

> Except: There's still no password for the user so the root user has
> to set it, and GET THIS:  The encrypted password string ends up in
> "/etc/passwd" instead of "/etc/shadow"!  Do the AX.25 programs know
> about and check "/etc/shadow" for the encrypted password strings?

Why I didn't remember this as we played last night I don't know,  but it 
never did support shadow passwords. 

I remember adding in support for the WETNET network but I can't recall 
if I ever submitted the changes. (hey it was over ten years ago after all:-)

Obviously I must not have.  

I'll dig thru my archives and see if I can remember how I did it.  If I recall 
correctly it wasn't all that hard.

Ken
