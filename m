From: cathrynham <cathrynm@junglevision.com>
Subject: Re: standard_window_size.
Date: Tue, 02 Dec 2008 16:59:14 -0800
Message-ID: <4935D9E2.7000306@junglevision.com>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com> <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org> <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com> <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: 'Linux-Hams' <linux-hams@vger.kernel.org>

Bob Donnell wrote:
>
> As a more advanced option for serial-port-interfaced TNC's is that I know
> that some TNC's can be configured to provide CD information, usually on the
> CD line.  That information could be used by the AX.25 driver to pause
> timers, as an alternate AX.25 driver attachment option.
>   

This sounds like a good idea.  If CD is available we only queue the packets
when CD transitions from 1 to 0, indicating that the sending station is 
done transmitting
and only after the stack has processed its entire receive queue.

Maybe not ideal, I was thinking the ax25 code could wait for 'nothing has
been received for XX time' as a way to hackily detect the 'end of 
transmission'
on a half-duplex channel.


I'm not sure how you get that 'CD' bit all the way from the TNC up to the
Linux ax25 stack.  It would be a hideous hack, but could we just
write a file to '/proc/net/ax25/ax0/CD and set that to 0 or 1?
