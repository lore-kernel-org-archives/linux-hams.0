From: Jim Bayer <kc9aop@gmail.com>
Subject: Re: Digi-ned output file and logrotate
Date: Tue, 12 Jul 2005 10:24:04 -0500
Message-ID: <e524c532050712082454fb2111@mail.gmail.com>
References: <Pine.LNX.4.44.0507120900580.14121-100000@srv01.compumont.com>
	 <Pine.LNX.4.44.0507120916250.14121-100000@srv01.compumont.com>
Reply-To: Jim Bayer <kc9aop@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0507120916250.14121-100000@srv01.compumont.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Bill,

You can configure logrotate to rotate a log file based on size.  Then
it can be compresssed and even emailed to a given address.
 
If you need syntax I can scare some up for you

 
-- 
'73'

Jim - KC9AOP


On 7/12/05, Bill Vodall <wa7nwp@jnos.org> wrote:
> 
> Another Linux question:
> 
> 
> Is it possible to use syslogd on stdout from an application?
> 
> 
> I'd like to save the verbose output from digi_ned in a file
> for monitoring.  I don't want the file to get too large.
> 
> Restarting the program on a regular basis would be one solution
> but I'm hoping for something cleaner.
> 
> 
> Hmmm.   Maybe "logrotate" is what I'm looking for.
> 
> Any suggestions or hints?
> 
> Thanks,
> Bill - WA7NWP
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
'73'

Jim - KC9AOP
