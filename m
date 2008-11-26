From: "Jim Kusznir" <jkusznir@gmail.com>
Subject: Adding a "virtual node"?
Date: Wed, 26 Nov 2008 10:37:43 -0800
Message-ID: <df8c8a6d0811261037j96327cbk4f38f156e5f3da81@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=ziFG5jVeH61PPvUfi0UGqFTamq+cSmLOj/wONnNv/Oo=;
        b=oraAEVhHAn53GvPC8QZi4OXTJI4kHWxgSA0z8F7kK2a9mf7OQsvHOM9mDHkLXEWC9x
         yZuhgoKn51Gi4Ath+1hQKbdJqVe9OtMCQkN/Yai9j0tmHCeFIdJI5kVQ4bk7tWjyhd1/
         0hN1R4YPYDNOmAsfhQhyUfl6v2NtwePjnQFco=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi all:

I am trying to do some "interesting" configurations under linux with
netrom.  It seems simple enough, yet I haven't figured out how to
actually set this up.

I want to start with a "normal" linux system: ax25 running, netromd
running with node (say, #DWMSW:KE6DWM-6), and then "create" another
netrom node/ssid that is accessable via me (say, I was running an FBB
BBS and I wanted "DWMBBS:KE6DWM-7").  My neighbors should show that as
accessed via #DWMSW.

The closest I've been able to get so far is actually replace #DWMSW
and my node ssid with the DWMBBS and my bbs ssid, then in ax25d, have
<netrom> run my bbs access program, and on the ax25 port (which uses
the same SSID as my netrom node -- I tried having them different, but
it confused people), I added a L line for my netrom neighbors.  This
was required to prevent ax25-level connects to support netrom traffic
from getting routed directly to the BBS.

Any ideas/thoughts?  This is easy to do at the AX25 level; I thought
it should also be easy at the netrom level, but so far it seems that
the linux netrom stack is set up to only support 1 SSID/alias per
system.

Thanks!
--Jim, KE6DWM
