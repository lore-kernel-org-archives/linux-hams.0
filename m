From: Matt VK2RQ <matt.vk2rq@gmail.com>
Subject: Re: Removing unwanted NET/ROM nodes
Date: Thu, 27 Dec 2012 19:50:55 +1100
Message-ID: <5282751B-2DC5-4AEE-8470-F6D81EEB5173@gmail.com>
References: <12f24a67.1a9da.13bdab2690f.Webtop.51@rtcubed.org>
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:content-type:mime-version:subject:from:in-reply-to:date
         :cc:content-transfer-encoding:message-id:references:to:x-mailer;
        bh=6ug7T87FaXgzvVU0HBP+jQdCpgsDXgC0tyJXx8aXSo4=;
        b=yjCJJ2SCA5ITHopyrPT72vs3TCrQ5QjSu0W+EFkaez3mT5UH2hsvQMi3lOKhrWW13L
         AbK/nyP0HeqlPb+ibKiwRD2Bxun+UEnmNBzX5DvC2e/ziMNqSzJAcCIRrzOrtd0v6ZEm
         Ve7N3mOkYeu31DB/OJeRk2sfOqWbgOc46OY9rsFI8wExN66xN7bb3JLzbcHWl4wZG6VC
         7cYIKvTJwk19qh2qtWWgnYnDpY6Hxq+NE+Q3kLEBOBnD304g2QexhUxSi74NaxOhqGXT
         E5iAi46DWnWHXG2CuEh5qVHtE64JxqC9z1jMNOg4xraR2r8L26DNeyU46WZ1HaExg9eg
         JP3g==
In-Reply-To: <12f24a67.1a9da.13bdab2690f.Webtop.51@rtcubed.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kd1zd@rtcubed.org
Cc: linux-hams@vger.kernel.org

You can lower the quality of the undesired node with the nrparms command:

nrparms -nodes <node_callsign> + <node_mnemonic> <quality> <count> <port> <neighbour>

eg. set quality to 10, count to 6, port to the AX25 port used to access the node, and neighbour is the callsign of the node you route through -- will be the same as <node_callsign> if you route to it directly.

73, Matt VK2RQ

On 27/12/2012, at 3:50 PM, kd1zd@rtcubed.org wrote:

> I am on a packet frequency that has 2 nodes that I can both hear and transmit successfully.  The connections with them are solid.  There is a third node that I can hear, but cannot transmit and make a connection. When I go to make a NET/ROM connect, Linux for some reason decides that it wants to use the third node, and as a result, I can't connect to other nodes in the list
> because of the failed connection.
> 
> Is there a command I can run with cron to make Linux "forget" about routing through the third node?  All three nodes are part of the same system, and linked via microwave to each other, so all I need is a route to one of the good nodes, and I will be able to get to the third if needed routing through them.
> 
> 73
> Bob
> KD1ZD
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

