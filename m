From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: Linux AX.25 Socket programming
Date: Sat, 4 Jan 2003 11:26:09 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301041120160.9645-100000@zl2bsj.ampr.org>
References: <20030103210222.A10721@pull.privacy.nb.ca>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030103210222.A10721@pull.privacy.nb.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: M Taylor <mctylr@privacy.nb.ca>
Cc: linux-hams@vger.kernel.org



On Fri, 3 Jan 2003, M Taylor wrote:

> For portable Perl, 
> 	$/ = \015;	# CR

Try:
        $/ = "\015";

Perl wants a string. If you give it an integer number, it gets 
interpreted as a buffer size....


Wilbert, ZL2BSJ



