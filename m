From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: Linux AX.25 Socket programming
Date: Mon, 6 Jan 2003 22:28:18 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301052313350.3934-100000@zl2bsj.ampr.org>
References: <Pine.LNX.4.44.0301041120160.9645-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0301041120160.9645-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


On a similar note: I am now trying to get a Bash script, started by 
the ax25d daemon,  to accept input from a user.

The Bash command I am trying to press into service is the 'read'
built-in. The function keeps waiting for a line-feed that never comes.
I have tried things like:

 read -d \x0d input_string
 read -d \015 input_string
 read -d \r   input_string

etc etc, without any success.

How can I read user input with the Bash shell?


Wilbert, ZL2BSJ



