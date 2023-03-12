From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Backport to LTR?
Date: Sun, 12 Mar 2023 11:05:54 -0700
Message-ID: <8a2cea63-b0e2-c348-1b72-0f810c022332@trinnet.net>
References: <CANnsUMExojiA6ZNyH=_zjO44N4hR0ytqj-BWrRjO0L6Ox=MjsA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CANnsUMExojiA6ZNyH=_zjO44N4hR0ytqj-BWrRjO0L6Ox=MjsA@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>


Hello Chris,

I think this post covers your question:

https://unix.stackexchange.com/questions/715465/how-to-submit-patches-and-fixes-to-lts-linux-kernels

--David
KI6ZHD


On 03/11/2023 12:48 PM, Chris Maness wrote:
> I am wondering what the process is to get maintainers to backport
> AX.25 fixes to LTS kernels.  Any suggestions?  This is a diff I pulled
> off the latest LTS kernel, so unfortunately it still has not been
> committed.
>
> diff linux-5.15.100/net/ax25/af_ax25.c linux-5.15.89/net/ax25/af_ax25.c
> (I patched 5.15.89 by hand, and it has been working solid on both
> x86_64 and also 64 bit Pi.
>
> I am going to the latest release branch and see if runs my
> Slackware-15 ok.  I will keep my stuff as a fallback.
>
> 64a65
>>        spin_lock_bh(&ax25_list_lock);
> 66d66
> <               spin_lock_bh(&ax25_list_lock);
> 68d67
> <               spin_unlock_bh(&ax25_list_lock);
> 70a70
>>        spin_unlock_bh(&ax25_list_lock);
> 83a84
>>        ax25_dev->device_up = false;
> 93a95
>>                                ax25_cb_del(s);
> 105a108
>>                        ax25_cb_del(s);
> 998,1000c1001,1005
> <                       release_sock(sk);
> <                       ax25_disconnect(ax25, 0);
> <                       lock_sock(sk);
> ---
>>                        if (!sock_flag(ax25->sk, SOCK_DEAD)) {
>>                                release_sock(sk);
>>                                ax25_disconnect(ax25, 0);
>>                                lock_sock(sk);
>>                        }
> 1056,1060c1061,1067
> <               del_timer_sync(&ax25->timer);
> <               del_timer_sync(&ax25->t1timer);
> <               del_timer_sync(&ax25->t2timer);
> <               del_timer_sync(&ax25->t3timer);
> <               del_timer_sync(&ax25->idletimer);
> ---
>>                if (!ax25_dev->device_up) {
>>                        del_timer_sync(&ax25->timer);
>>                        del_timer_sync(&ax25->t1timer);
>>                        del_timer_sync(&ax25->t2timer);
>>                        del_timer_sync(&ax25->t3timer);
>>                        del_timer_sync(&ax25->idletimer);
>>                }
>
>

