From: C Schuman <k4gbb1@embarqmail.com>
Subject: Re: AX25 in /etc/init.d
Date: Fri, 01 May 2009 16:40:02 -0400
Message-ID: <49FB5E22.2070000@embarqmail.com>
References: <49FA6FB8.1030706@embarqmail.com> <20090501200629.GB4652@flying-gecko.net>
Reply-To: k4gbb1@embarqmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; d=embarqmail.com; s=s012408; c=relaxed/simple;
	q=dns/txt; i=@embarqmail.com; t=1241210408;
	h=From:Subject:Date:To:MIME-Version:Content-Type;
	bh=nZJl+zhZflDcIdNoARsVXKntCLw=;
	b=QA3/gOxMl5hJ2HbRTIkvoOfxs3GRA+n5k5jsYY6xwbsKHQteP1/EWOFF68cZjMYg
	evH3T8JIr5Kgx9zJ4mo9aSUWxlSf24/F9AHToYJhPjfDUeSZwV7qMTF7YEHdUw5t;
In-Reply-To: <20090501200629.GB4652@flying-gecko.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick Ouellette <pat@flying-gecko.net>
Cc: Linux-Hams <linux-hams@vger.kernel.org>


Patrick Ouellette wrote:
> On Thu, Apr 30, 2009 at 11:42:48PM -0400, C Schuman wrote:
>   
>> I installed AX.25 on a system a couple of days ago and when I copied my  
>> usual ax25 script into /etc/init.d/ I received a message saying that the  
>> script did not have a proper header. The script worked without any  
>> problem, but it started me thinking.  Most Ax.25 Howto Docs make little  
>> of the bootup process. Some even suggest that the kissattach and other  
>> config commands be placed in the rc.local file.
>>
>> AX.25 is becoming a major work in Linux systems. It deserves to have  
>> it's own boot script. I have been using the same script for years and I  
>> recently added the the requested header. I would like to suggest that  
>> AX.25 How to docs include the use of such a script and have attached my  
>> script as an example.
>>
>> 73
>> <<Charley>>
>>      k4gbb
>>
>> #! /bin/bash
>> # Provided by Charles S Schuman ( K4GBB )
>> # 04/29/09
>>
>> ### BEGIN INIT INFO
>> # Provides: ax25
>> # Required-Start: /etc/ax25/ax25-up
>> # Required-Stop: /etc/ax25/ax25-down
>> # Default-Start: 3 4 5
>> # Default-Stop: 0 1 2 6
>> # Short-Description: Ax.25 initialization
>> # Description: This script provides the control for the ax.25 packet  
>> radio service.
>> #           The fine tuneing is accomplished via /etc/ax25/ax25-up and  
>> /etc/ax25/ax25-down.
>> #
>> ### END INIT INFO
>>
>>     
>
> I assume the lines between "BEGIN INIT INFO" and "END INIT INFO" are the 
> header lines you are referring to.  If so, please understand that not all
> Linux distributions use the same startup process and so do not necessarily
> use or require those headers.  
>
> FWIW, Debian includes a startup script in the ax25-tools package.  It sets up
> the mheardd, ax25d, and netromd.
>
> 73,
>
> Pat
>   
Thanks Pat,
Yes, your assumption is correct.

 I use Ubuntu and Debian.  I have never seen any of the Debian Startup 
scripts for AX.25. 

The problem with with most of the supplied or example start scripts is 
that they never do what you want them to do.
The Linux HAM Radio community are an assorted lot.  I have approx 14 
Packet Radio servers and no two are the same.
I have been Elmering a number of individuals who are attempting their 
first installion of Linux. Some just want a RMS Gate.
Others want a BBS, Node and an assortment of other apps.

My point was not really "We need to add Header Info", but more toward 
the "We need a more versatile script"
By pointing our start up script at /etc/ax25/ax25-up & down we can use a 
common script to transition to an uncommon system initialization.

73
<<Charley>>
      k4gbb





