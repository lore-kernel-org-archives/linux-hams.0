From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Linux AX.25 Socket programming
Date: Fri, 3 Jan 2003 21:02:22 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030103210222.A10721@pull.privacy.nb.ca>
References: <Pine.HPX.4.10.10301031914210.15434-100000@saturn.trs.ntc.nokia.com> <Pine.LNX.4.44.0301040925500.9645-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0301040925500.9645-100000@zl2bsj.ampr.org>; from zl2bsj@zl2tze.ath.cx on Sat, Jan 04, 2003 at 09:47:05AM +1300
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Cc: linux-hams@vger.kernel.org

On Sat, Jan 04, 2003 at 09:47:05AM +1300, Wilbert Knol wrote:
> 
> 
> > The standard end-of-line in AX.25 related world is CR
> 
>    # Un-buffer STDIN:
>    $|=1;
>    # Use AX25 EOL:
>    # (Check the '$/' paragraph in 'man perlvar')
>    $/="\r";

For portable Perl, 
	$/ = \015;	# CR
because \r and \n can vary across different Perl platforms (e.g. MacOS as
I recall).

