From: John Ronan <jronan@tssg.org>
Subject: Re: standard_window_size.
Date: Mon, 1 Dec 2008 22:47:53 +0000
Message-ID: <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: John Ronan <jpronans@gmail.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

Curiously,

No matter what I set it to, it remains at 2.

Thoughts appreciated.

de John
EI7IG

On 1 Dec 2008, at 20:32, John Ronan wrote:

> Hi,
>
> I've stumbled across a problem and I'm not sure where to look next.
>
> I've been attempting to do some testing over ax25.  I've been using  
> kiss mode on both ends.  Now, when I attempt to transfer data using  
> a window size of 3, it seems that the kernel seems to think that  
> the window size is still 2, even though I've set it to three.
>
> In the example below I've connected using axcall -w 3 to a PTCIIex  
> TNC's PMS (EI7IG-8)that has maxframe set to 3.  I've asked if I can  
> read a message, it attempts to dump three packets, but this end  
> replies after only 2.
>
> 1200: fm EI7IG to EI7IG-8 ctl I32^ pid=F0(Text) len 4 20:29:42
> 0000  r 1.
> 1200: fm EI7IG-8 to EI7IG ctl I33^ pid=F0(Text) len 49 20:29:44
> 0000  ..file: EI7IG  nr: 1  from: EI7IG  title: .-----.
> 1200: fm EI7IG-8 to EI7IG ctl I34^ pid=F0(Text) len 255 20:29:46
> 0000  test.OSCAR III [-]           ..1 01293U 65016F   07002.23646176
> 0040  -.00000070  00000-0 -98573-5 0  8666..2 01293  70.0715 309.6096
> 0080  0021217 281.7228  78.1502 14.04522134133852..AO-5 [-]
> 00C0       ..1 04321U 70008B   06364.97899830 -.00000031  00000-0  10
> 1200: fm EI7IG to EI7IG-8 ctl RR5v 20:29:47
> 1200: fm EI7IG-8 to EI7IG ctl I35^ pid=F0(Text) len 255 20:29:47
> 0000  000-3 0  8153..2 04321 102.0762 344.1977 0027719 242.8215 117.00
> 0040  30 12.52148418688218..AO-6 [-]                ..1 06236U 72082B
> 0080    07001.53324891 -.00000027  00000-0  10000-3 0  7711..2 06236 1
> 00C0  01.4761  37.7834 0004002 202.4746 157.6152 12.53069131564971..A
> 1200: fm EI7IG-8 to EI7IG ctl I35^ pid=F0(Text) len 255 20:29:50
> 0000  000-3 0  8153..2 04321 102.0762 344.1977 0027719 242.8215 117.00
> 0040  30 12.52148418688218..AO-6 [-]                ..1 06236U 72082B
> 0080    07001.53324891 -.00000027  00000-0  10000-3 0  7711..2 06236 1
> 00C0  01.4761  37.7834 0004002 202.4746 157.6152 12.53069131564971..A
> 1200: fm EI7IG to EI7IG-8 ctl REJ6v 20:29:50
>
> If standard_window_size doesn't set the window size, where else can  
> I do it?  I've tried several kernels and two TNC's at this stage.
>
> Help appreciated,
> de John
> EI7IG
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



