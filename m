From: 9a4gl@9a0tcp.ampr.org (Tihomir Heidelberg)
Subject: AX.25 unaccepted socket makes problems
Date: Tue, 27 May 03 18:17:48 CEST
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <2197@9A0TCP>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi linux-hams,

finaly I found a way how to produce AX.25 kernel get mad,
I mean, when "cat /proc/net/ax25" produce segmentation fault,
and everything got unstable.

If your program bind ax.25 socket for listening, other station
connects to that listening socket and if listening socket dies
without accepting new connection from you program, after short
period the things got mad...

In ax25_destroy_socket function (af_ax25.c), there is a while
loop for dequeuing those unaccepted connections and preparing
them to die when heardbeat catch them. Also, there is code in
ax25_std_heartbeat_expiry function (ax25_std_timer.c) that
should destroy those connections, unfortunately those connection
are NOT destroyed here ! A condition:
        (ax25->sk->state == TCP_LISTEN && ax25->sk->dead)
is not true because state of those connections are not
TCP_LISTEN. State is TCP_ESTABLISHED or TCP_CLOSE, depending if
other end disconnected or not. Cannot get the reason why
segmentation fault is happening, but hope someone else can find
a reason when problem is reproducable.

To avoid this problem I added to ax25_destroy_socket function
(af_ax25.c) following:
        if (skb->sk != ax25->sk) {
+               skb->sk->state     = TCP_LISTEN;
+               if (!skb->sk->dead) {
+                       skb->sk->state_change(skb->sk);
+               }
                skb->sk->dead  = 1;
                ax25_start_heartbeat(skb->sk->protinfo.ax25);
                skb->sk->protinfo.ax25->state = AX25_STATE_0;
        }

I am pretty sure that this is not the way how problem should be
fixed, there should be a different way how to mark socket for
destroying, but at least, I got rid of this problem.

Also, some months ago I mention here that regulary I get this
AX.25 kernel behavior after few days of running 9A0TCP gateway
machine. I noticed that very often ax25d died or had to restart
ax25d because it was not handling connections. Think this
bind/non-accept kernel problem is very probably the reason.

Anyone agree with me ? Can anyone make a resonable patch/fix
for this problem ? Maybe setting skb->sk->destroy to 1 is right
way ?

73 de Tihomir Heidelberg, 9a4gl@9a0tcp.ampr.org
