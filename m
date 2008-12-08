From: Pino Zollo <pinozollo@gmail.com>
Subject: Re: hamlib/beacon code?
Date: Mon, 8 Dec 2008 08:37:36 -0300
Message-ID: <200812080837.48601.pinozollo@gmail.com>
References: <20081103211757.GJ12042@charybde.local> <5659421a0812071249w628a4e3cq1a32165e11bf8643@mail.gmail.com> <493C3FFE.7080505@linux-it.nl>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to
         :subject:date:user-agent:references:in-reply-to:mime-version
         :content-type:content-transfer-encoding:content-disposition
         :message-id;
        bh=WAl52f2lim5KUMXqKo7bnRX2By8v6RkrBL3JllzDclk=;
        b=cZ+tSJOkNo2wGtIdlfcq3Bl19vw/S/T+0NkQ+TDTh0VoU8qUAS1WYNq9rk/7bxEuJC
         c9k4V1tSrRdGc8HmHqIkVIINvN9h9f5AzcXDM6tf5O4lAt/96lySDYrK8aDri8yfh828
         P+1jWDXCJ/UvRJGQTZM05fnzK4y6lHLKI7ns8=
In-Reply-To: <493C3FFE.7080505@linux-it.nl>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Roeland Th. Jansen" <hamlib@linux-it.nl>, "Hams, Linux" <linux-hams@vger.kernel.org>

Alle 18:28, domenica 7 dicembre 2008, hai scritto:
> before I am wasting my time too much -- are there people out here who
> have or know of software that is interfacing with hamlib and can be used
> to control a suitable radio for beacon functionality?
>
> I have written some code that uses the TX line to send out a CW message
> hardcoded. For me it's just fine but I am thinking of making it more
> general purpose and think that the hamlib interface could be a nice
> start to use.
 cwdaemon does it very well at kernel priority.
It works fine also on my old  500 MHz clock PC.

73 Pino ZP4KFX
