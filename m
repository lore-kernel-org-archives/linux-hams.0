From: "John Williams" <john-w@bigpond.com>
Subject: re ax25 support in aprsd
Date: Tue, 27 Jan 2004 16:35:39 +0930
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4016935B.24867.9B8E3F@localhost>
Reply-To: john-w@bigpond.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

OK
second, third and fourth appear to have filtered feeds. 

In the case of third they are 

23 & 10152   Full APRS-IS Feed (no echo) 
10151   Full APRS-IS Feed (echo) 
10153   Full APRS-IS Feed w/ 30 Minute Dump 
1314     Messages Only 
14580   User Defined Filtering & CW 
14579    East Coast USA Only Feed 
10154    USA Only Feed 
10155    Europe Only Feed 
14501    Status Page (html) 
14511    Status Page (text) 


So if you did this  

Server third.aprs.net 14579 hub-sr 

You would only see East cost US stations. 

For your area in CA you will probably want to define your own filter 

In this case used port 14580  and use the range and or prefix filters. 

Read the info in this link. 
http://www.aprsfl.net/status.txt 

Cheers 
John 
VK5ZTY

