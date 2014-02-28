From: Larry Levesque <ka1vgm@gmail.com>
Subject: Re: soundmodem
Date: Fri, 28 Feb 2014 18:24:11 -0500
Message-ID: <53111A9B.9010508@gmail.com>
References: <20140227163306.GH30054@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=1RNMy5Z9ejvmZposfm5MkUBmNaStmc0Tuan5JVg78gY=;
        b=JNIhvK3gJqOOBZzvLarKzmu1xfZ2s48PqmOe/FmIh3wCJcB4mtE5t3MXs3KvAVidk8
         Wsbdq3ADlGPFxfhXZzh1n/MKIPHswLAIz6xICmORF2ECgctQC+MVtbFo0LOM6UpelXTT
         vfMUH9rq2LWP4nhwqbdgTIkEbK+5TQ/VQLF8a+huY5NzJveFFDbzkdXy69/KYVqfcN0j
         ilFBVIORKpklknSGOmQYLPfiCFLZhsUytn8NRAmGjNnHxaKrR6Kr0a8iwe+fXZGsetxg
         g9EHKaCSIRU4kN3BeDZceTyXE9lrOz61iXg9SuMeAD1dBD4Shrl7MYu9A6RJlIG3H5/D
         q4uw==
In-Reply-To: <20140227163306.GH30054@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: folkert <folkert@vanheusden.com>, linux-hams@vger.kernel.org

Sounds like you need to switch you radio to the correct mode.

I am guessing it is a Yaesu and you have it set for Packet/data which 
wants to use the data jack on the back.

Try switching it to a standard mode and use the mic jack or use the data 
jack for the data modes.


On 02/27/2014 11:33 AM, folkert wrote:
> Hi,
>
> I'm having a bit of trouble to get a soundmodem working.
> The problem is that the radio only transmits silence. So PTT works.
> I tried with and without a line-level-to-mic-level resistor network, I
> also tried that line-level-thingy together with a capacitor to solve the
> problem of the couple-of-volts on the mic-pins of the radio, but always
> silence. I verified that audio comes out of the soundcard and also out
> of the resistors (something like:
> http://www.hometheatershack.com/forums/attachments/spl-meters-mics-calibration-sound-cards/11906d1232997532-ecm8000-microphone-measuring-techniques-usage-discussion-line-mic-pad.jpg
> ).
> Any ideas?
>
>
> Folkert van Heusden
>

