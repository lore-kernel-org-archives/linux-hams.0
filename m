From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: suggestions to ax25rtd, ax25d and axspawn
Date: Mon, 24 Jun 2002 23:19:01 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020624211901.GA7687@x-berg.in-berlin.de>
References: <20020619193848.GA21764@x-berg.in-berlin.de>
Reply-To: thomas@x-berg.in-berlin.de
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020619193848.GA21764@x-berg.in-berlin.de>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

> I. ax25rtd
> ----------
> my solution to this problem is this little change in ax25rtd/listener.c:
> 568c568
> <               if ((config = dev_get_config(ip_encaps_dev)) == NULL)
> ---
> >               if (*ip_encaps_dev && (config = dev_get_config(ip_encaps_dev)) == NULL)

sri, i missed this one (ax25rtd/config.c):
604c604
<                       if ((config =
---
>                       if (*ip_encaps_dev && (config =

73,
	- thomas  dl9sau
