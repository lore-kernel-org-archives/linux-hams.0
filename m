From: Alejandro Santos <alejolp@alejolp.com.ar>
Subject: Re: TAP device & ax25 call
Date: Wed, 1 Jun 2016 16:16:14 +0200
Message-ID: <CAOnrUC00Z3sQF970LwXmL2HOye+Pf+4ak2A-V85gq2aHn7-QvQ@mail.gmail.com>
References: <20160531175802.GE19668@belle.intranet.vanheusden.com> <CAOnrUC3X-xcV6KZTFKFNLYJ6nowMUAu2XqHbEhx+PB0JE1giXw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=alejolp-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=5tK4gWzyMAb8whxmyv7uAs0VYYK2v+Avq3faqKHKl3o=;
        b=miG15fTyxKtx3M4XlV7/Wf1kP051cGMc7E8Ck/60pGHGWV16ablFp62OSfaiemG/R+
         M64i/STasSiG9eUeUQ+vA2G/NYJH2BFYupOLJouwJ/JXA4+VaWGsrM0HDvP8VcrXR2mC
         dF0iS0gcgefjMTDlEI4/qh6ilIjyoEraOg+sRjO+qej+VN0SU1YgHSPLJL6Ti9GJveRC
         HFQrSc/qiASsDdg/NVZFQYLh3hcYF6qakLg3iouwQ01Zyc14CqlPIAI1i7SEhqM8g/7u
         y9hSX4BDYguHr/cX52fHDpegXZRQKx7u63MHw3CI883iG7cDg1LrwHRdX/aL0MFMdoXg
         WtvA==
In-Reply-To: <CAOnrUC3X-xcV6KZTFKFNLYJ6nowMUAu2XqHbEhx+PB0JE1giXw@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: folkert <folkert@vanheusden.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

it seems I've found some kernel bug:

https://gist.github.com/alejolp/c96089059af378bffd3c0363d8a29b03

# ./a.out em1 "LU4EXT-15"
Creating TAP AX25 device name em1, call name LU4EXT-15
dev 3 name em1

# beacon -s LU4EXT hola

Message from syslogd@debian at Jun  1 16:11:24 ...
 kernel:[ 2589.973799] skbuff: skb_under_panic: text:ffffffffa0a36810
len:20 put:15 head:ffff880223282a00 data:ffff8802232829fe tail:0x12
end:0xc0 dev:<NULL>

The complete Kernel call trace from dmesg is in the gist




On Wed, Jun 1, 2016 at 2:31 PM, Alejandro Santos <alejolp@alejolp.com.ar> wrote:
> Hi all,
>
> I've just double checked this and I agree, I'm unable to set the SSID.
>
> Also tried manually with ifconfig and axparms, the SSID is ignored:
>
> em0 is a TAP device.
>
> # axparms -setcall em0 "LU4EXT-15"
> # LANG=C ifconfig  em0
> em0       Link encap:AMPR AX.25  HWaddr LU4EXT
>           BROADCAST MULTICAST  MTU:256  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:500
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>
> # ifconfig em0 hw ax25 "LU4EXT-15" mtu 256
> # LANG=C ifconfig  em0
> em0       Link encap:AMPR AX.25  HWaddr LU4EXT
>           BROADCAST MULTICAST  MTU:256  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:500
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>
> 73
> Alejandro
>
>
>
> On Tue, May 31, 2016 at 7:58 PM, folkert <folkert@vanheusden.com> wrote:
>> Hi,
>>
>> While trying to use tap-devices for ax.25 I noticed some issues.
>> Biggest issue being that I could not get it to work. Now some guy on
>> stackoverflow dug a bit further and apparently something goes wrong
>> with the ssid.
>> http://stackoverflow.com/questions/22465138/creating-a-tun-network-device-with-ax-25-encapsulation/37534385#37534385
>> I thought you may wanted to know this.
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Alejandro Santos



-- 
Alejandro Santos
