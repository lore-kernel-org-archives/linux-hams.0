From: Dave Riesz <dave@riesz.net>
Subject: Re: multi-channel soundmodem
Date: Tue, 3 Nov 2015 20:17:03 -0800
Message-ID: <CAOG7C-hRNPhT0--3+_mSOpwgTMWagOKpF-HT4sNFAD8ZAAGS3g@mail.gmail.com>
References: <CAOG7C-hJUPVnYzpsXxkUpV_gMM8Y=950ohVX+zzfCsOMOa9EEg@mail.gmail.com>
	<56398340.4080803@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=mfxq3oX37MrGhX4EKHC67ukuP76xJAPVSdZm/Yu7YWc=;
        b=RTaiX0gED7Z8+E6Z5EFaEvIqLQRtwqXT4J04iq5iu5sUrLSKN+gRz/nOL+QY6d1m0h
         QarJlw+oGdV6GMB9NJxKHsMCFIOjrfFjX/yW4iNg8s4ayKhpvSim7HlB+pBaOp40aqor
         0HI1e5I60MNymylrAID6O2joD5FLHMZJMoChRpB1d0THuyWE4lpFAASn+LFvTnxCMoml
         qDUABvC4NQ2dfYBEytNWeyuttGmmRyZt0KXfPZ2fvgLx/vfag8g1raaFs/TjdHQ+4MsC
         ewbzD+VH8GjjQaRzyKTg9/2LnZWRsL/N7+PjfUbkxVbjDdTISS6xH/hE2VzKuDuoOOba
         +uCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riesz_net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=mfxq3oX37MrGhX4EKHC67ukuP76xJAPVSdZm/Yu7YWc=;
        b=AYb/DfHD21pV1myV/ppBohGYso0HoXN4+tVemxPEkvjPqpVWb5buCpZPxTORmM3eT2
         /oXhA90JHtktDVsmOWKNG13NWjsmIDKq7UncEg7bsKU6JzN3vtw9ryT1gsmFaPhmCnQB
         vG6Zns2X4HxOIZxvcKpRO0NcmfXx8fqgMmbDLDd1yjsZ9si8Y2t4h6Fsq0IYVSrW4NQE
         tJ25UvEe1sOQQ8maLtF0lKzsmwO6KWTdFi8LtmmX2n999vCT6Wi9Y1kCVMHvxo+WhLv/
         FRtirRM4OwQUxhrerhOwbJtcrkjTl3dD85MXdI8TIRfUFYW1/TyVxyONvZRlMwoxT3RJ
         uriA==
In-Reply-To: <56398340.4080803@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: linux-hams@vger.kernel.org

Ah, HA.  I was wondering why there was so little information around on
soundmodem.  Soundmodem is just what I knew from back in the '90s.
I'll start again with Direwolf and see how far I get.

Thanks for the pointer!

Dave Riesz

On Tue, Nov 3, 2015 at 8:02 PM, David Ranch <linux-hams@trinnet.net> wrote:
>
> Hello Dave,
>
> Is there a specific reason why you want to specifically run Tom Sailer's
> Soundmodem or are you just trying to get back into packet? Though I think
> soundmodem can support stereo out for two different radios, the support
> might be iffy as Soundmodem really hasn't received any support in many
> years.  What I can recommend which DOES support stereo input, stereo output,
> multiple soundcards as well as superior weak signal packet decodes is
> Direwolf:
>
>    https://github.com/wb2osz/direwolf/releases
>
> --David
> KI6ZHD
>
>
>
> On 11/03/2015 06:54 PM, Dave Riesz wrote:
>>
>> Hello.  I'm trying out the soundmodem for the first time in nearly
>> twenty years.  I would like to set it up to have two channels running
>> from a single line-out, carried separately on stereo-left and
>> stereo-right.  I've seen hints here and there that this is possible,
>> but no proof.  Is it, in fact, possible?  Has anyone here done it?
>>
>> Thanks,
>> Dave Riesz, N1OSN
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
