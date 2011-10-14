From: Dave Platt <dplatt@radagast.org>
Subject: Re: Compiling FBB
Date: Fri, 14 Oct 2011 15:20:24 -0700
Message-ID: <4E98B5A8.1000503@radagast.org>
References: <4E93FBEC.7050907@free.fr> <4E98B35E.1050602@eunet.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E98B35E.1050602@eunet.rs>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Miroslav Skoric <skoric@eunet.rs>
Cc: linux-hams <linux-hams@vger.kernel.org>


> I already had libax25 (as well as ax25-apps and ax25-tools) before
> trying to compile FBB. Btw, in respect to repositories of Ubuntu and
> Debian communities, I installed the version they both provided: libax25
> 0.0.11-6.1)

Debian and Ubuntu (and I suspect most other Linux distros) split these
and most libraries into two parts:  the runtime portion, and the
development portion.

You need to have both installed, in order to compile and build
anything which uses the library.  You only need the runtime portion
to run programs that someone else has built.

On Debian, for example, the "libax25" package has the runtime,
and "libax25-dev" has the development portions.

