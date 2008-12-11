From: John Ronan <jronan@tssg.org>
Subject: Re: standard_window_size.
Date: Thu, 11 Dec 2008 08:49:52 +0000
Message-ID: <BDE0A29E-E674-46AA-81F8-756301C6F295@tssg.org>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com> <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org> <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com> <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com> <50DA4EB2-D38C-4512-B382-F2F5903B3310@gmail.com> <F5C50AA2-F675-4280-B079-0662CAAA8349@tssg.org> <D4E78BFF-CD8E-4281-B40D-D006E1090768@tssg.org> <493EB4E4.8060003@radagast.org> <325AA1D57A4349FDB3F232F90C474007@arkalmus.com>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <325AA1D57A4349FDB3F232F90C474007@arkalmus.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Linux-Hams <linux-hams@vger.kernel.org>


On 9 Dec 2008, at 19:42, Bob Donnell wrote:

> There is no provision in the AX.25 protocol for the negotiation of
>
[bigsip]
Bob, Dave, thanks for your detailed replies (I didn't get Dave's  
directly, only saw it on Bob's reply). I've printed off the email as  
it is going to require a few readings to fully understand it. MSYS's  
negotiation does sound like the business.

That said, the post put me on the right track. There isn't any  
protocol negotiation taking place.

The culprit was, in fact me, or at leas my understanding of AX25  
(call it dumbness if you like), which, I have to say is still spotty,  
and I must apologise to the list for wasting the bandwidth.

The T2 Timer is what I was missing.  I went and read the spec and  
came to
http://www.tapr.org/pub_ax25.html#2.4.7.4

The default T2 timer value of 3 seconds is just about perfect for two  
255 byte packets (which makes sense given the default window size is  
2). That is what was causing the replies to occur when they were.

FYI I'm just testing some DTN software (an AX25 convergence layer for  
the DTN Reference implementation developed by Darren Long G0HHW) vs  
raw ax25 connections (use axcall to connect to host, look at large  
file, time it, repeat etc). So I'm testing on point to point links  
and via a digipeater.  Bob, your comments have already given us some  
more ideas as to how to improve the current DTN convergence layer.

Once I get these tests complete I might look at getting IP to run  
efficiently over the same links, but that's another days work.

Thanks for the help and suggestions everyone.

Regards
de John
EI7IG
--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



