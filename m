From: 9a4gl@9a0tcp.ampr.org (Tihomir Heidelberg)
Subject: Re: ax25 kernel problem sometimes accur
Date: Thu, 05 Dec 02 15:43:05 CET
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <19525@9A0TCP>
References: <20021205011641.A18121@pull.privacy.nb.ca>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: your message of 	Thu, 5 Dec 2002 01:16:41 +0000.
             <20021205011641.A18121@pull.privacy.nb.ca>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mctylr@privacy.nb.ca
Cc: linux-hams@vger.kernel.org

Hi,

>> static void ax25_free_sock(struct sock *sk)
>> {
>>         ax25_free_cb(sk->protinfo.ax25);
>>         sk->protinfo.ax25->sk=NULL;
>> }
>> ...
>Well, it could crash your system. sk->protinfo.ax25 is kfree'ed in
>the line before it, so you are accessing invalid data...
>
>Your suggestion wants to be equalivent to sk = NULL;,
>so you should at least change it to use a valid statement.
>Though I wonder if you meant sk->protinfo.ax25 = NULL;

yap, you are right, this is not good. if anyone add that line,
please remove it, it can make problems.. but interesting is
that the kernel does not crash, hm...
that kfree is to short function to notice :)
I thought it does not free it beacuse it does not remove it
from ax25_list. But, after some debuging I see that control block
is removed before from ax25_list, and then ax25_free_sock is
called to clean the rest.

but, why we clean the ax25 connection in two steps ? I looked
in other protocols source and very few of them use socket
destruct... why ax25_release do not clean all ?

the problem I am trying to solve is why ax25_get_info get
crash... the one reason may be that we have dead socket in
control block of one of our connection (because other
connections are still working), and that can occur if from any
reason destructor is called without previous calling ax25_release.
Maybe there are other reasons, but just want to check if this
one is or isn't our problem.

how bad is idea to clean all for both destruct and ax25_release
in case it is not cleaned from the other one ? to me this is
not nice, but....

so, will play with it and add some debugging info and wait
to see if I can catch anything usefull.

73 de Tihomir Heidelberg, 9a4gl@9a0tcp.ampr.org
