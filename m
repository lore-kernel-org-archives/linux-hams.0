From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: xfbbd oddness.
Date: Tue, 09 Nov 2010 18:54:42 -0800
Message-ID: <4CDA0972.40108@junglevision.com>
References: <Pine.LNX.4.64.1005271432450.5422@ask.diku.dk> <20100527.162919.115912825.davem@davemloft.net> <4CD99C63.4030406@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CD99C63.4030406@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: bernard.pidoux@upmic.fr

You know, I'm not an expert on signal programming in Unix.
But, wouldn't another signal coming in during the wait cause
a the system to halt?



         for (i = 1; i < NSIG; i++)
         {
                 if (i == SIGBUS || i == SIGSEGV || i == SIGALRM)
                         continue;
                 signal (i, sig_fct);
         }


static void sig_fct (int sig)
{
         int pid, pstatus;

         sig &= 0xff;
         pid = wait (&pstatus);
         signal (sig, sig_fct);

	switch (sig)
	{
...
stuff
	}
}





This handler does nothing useful anyway except for
SIGHUP, SIGTERM, SIGBUS and SIGSEGV.  I don't see any
reason not to just ignore all signals except for the few
that do have a function here.  I'm going to let it run
like this, and see if it fixes the bug.


         for (i = 1; i < NSIG; i++)
         {
                 if (i == SIGBUS || i == SIGSEGV || i == SIGALRM)
                         continue;
                 if (i == SIGHUP || i == SIGTERM)
                         signal (i, sig_fct);
                 else    signal(i, SIG_IGN);
         }
