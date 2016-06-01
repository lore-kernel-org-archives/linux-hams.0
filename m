From: Alejandro Santos <alejolp@alejolp.com.ar>
Subject: Re: TAP device & ax25 call
Date: Wed, 1 Jun 2016 14:31:00 +0200
Message-ID: <CAOnrUC3X-xcV6KZTFKFNLYJ6nowMUAu2XqHbEhx+PB0JE1giXw@mail.gmail.com>
References: <20160531175802.GE19668@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=alejolp-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=eWF5MjXSAUfJWZ9tiRUmb10x3clKyf/klbHrIYopUpg=;
        b=RYKh5RWkBfhXo2OABtmQxCZfWxWe808RNSG0N/fdh9uZi7L7df/gSrsy9w1rHAh+Qt
         3cvpQCeEzpp55MpWGl6jwo6wrMO9eOLiTy2nTYYkRxdso5G2HxIyXsDfvTEQmW99gUu3
         Lv2A3Rzndv0VytxpcfH8nH377Qz8uccetZtXNihNVswrX0YYohUsKueKCvVJmmmGvUVz
         OZMlxKp62AxKNQBxIOGaQLnOl20RgE+HiFAzExazdQPFCgPC71sgrcYr/sJEtRnikwZF
         /wHmATvo+W2vPdOzJLWdhUkrk4tfPt5ExAzpUUEK4gQUQwC4IRkueo4JuFtjDB0IspTe
         s2xA==
In-Reply-To: <20160531175802.GE19668@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: folkert <folkert@vanheusden.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi all,

I've just double checked this and I agree, I'm unable to set the SSID.

Also tried manually with ifconfig and axparms, the SSID is ignored:

em0 is a TAP device.

# axparms -setcall em0 "LU4EXT-15"
# LANG=C ifconfig  em0
em0       Link encap:AMPR AX.25  HWaddr LU4EXT
          BROADCAST MULTICAST  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:500
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

# ifconfig em0 hw ax25 "LU4EXT-15" mtu 256
# LANG=C ifconfig  em0
em0       Link encap:AMPR AX.25  HWaddr LU4EXT
          BROADCAST MULTICAST  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:500
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

73
Alejandro



On Tue, May 31, 2016 at 7:58 PM, folkert <folkert@vanheusden.com> wrote:
> Hi,
>
> While trying to use tap-devices for ax.25 I noticed some issues.
> Biggest issue being that I could not get it to work. Now some guy on
> stackoverflow dug a bit further and apparently something goes wrong
> with the ssid.
> http://stackoverflow.com/questions/22465138/creating-a-tun-network-device-with-ax-25-encapsulation/37534385#37534385
> I thought you may wanted to know this.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Alejandro Santos
