From: Dave Stubbs <dave.stubbs@utoronto.ca>
Subject: Soundmodem Logging
Date: Sat, 05 Mar 2005 21:46:21 -0500
Message-ID: <422A6EFD.3060000@utoronto.ca>
References: <20040213100203.62bbe780.washer@trlp.com> <20040213193911.D220@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040213193911.D220@jeroen.pe1rxq.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hello all,

I'm using userspace soundmodem, and it works really great.  However, I 
have a question about the soundmodem logging setup.

I have the following in my script that starts up soundmodem:

soundmodem -sM -v 9

According to my reading, the -s switch should switch logging to the 
syslog, and the -v 9 switch should enable massive amounts of logging.

However, despite this, the syslog only gets one entry showing syslog 
startup, while the console gets the massive spew of log items.

Is there any way to redirect all these messages to the syslog instead, 
where I believe my command line setup told them to go?

Thanks,

Dave
VA3BHF
