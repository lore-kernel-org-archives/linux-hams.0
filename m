From: David Ranch <linux-hams@trinnet.net>
Subject: Re: "?" Command List
Date: Thu, 06 Dec 2012 18:04:16 -0800
Message-ID: <50C14EA0.3080708@trinnet.net>
References: <CADS0AtSe=a3AfMvPjNqvXA5DAmrE6t0aMWb-dbromj7+bj5kXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CADS0AtSe=a3AfMvPjNqvXA5DAmrE6t0aMWb-dbromj7+bj5kXQ@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


That depends on which "node" software you're running:   
Unode/Uronode/Awznode?

Unode/Uronode allows for configuring external commands but I don't see 
node.conf options for internal commands.  Looks like your going to need 
to either disable those commands via the source:

Assuming the stock Node program: 
https://code.google.com/p/ve7fet/source/browse/trunk/node/command.c?spec=svn11&r=11

Or you'll need to create a new help screen that can only display 
specific commands yet leave the hidden commands still functional.

--David




> Hello everyone,
>
> Is there anyway to configure what commands show up when "?" is used
> under Linux AX25? I did not see anything in node.conf.
>
> If possible I would like to trim the list to make it a little more
> friendly to non-Linux packet operators.
>
> KQ9N
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message tomajordomo@vger.kernel.org
> More majordomo info athttp://vger.kernel.org/majordomo-info.html
