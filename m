From: Frank Smith <frankiansmith@gmail.com>
Subject: Re: soundmodem on OpenWRT on ASUS WL-520gU router with USB audio
Date: Sat, 26 Sep 2009 12:00:10 -0300
Message-ID: <e741d6300909260800t7310f5fembb410ef146d3815e@mail.gmail.com>
References: <e741d6300909260513g4a6f29bal9cc2484e7c52159d@mail.gmail.com>
	 <CAA31203-51EC-4575-ADB0-45D6683B3F46@columbia.edu>
	 <e741d6300909260648t7bd45106odaefdf74725c810d@mail.gmail.com>
	 <0074D064-BA95-45EC-B65D-236611D801DC@columbia.edu>
	 <4ABE283D.3040303@columbia.edu>
	 <alpine.LNX.2.00.0909260748410.16303@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=jfn7c+wOQ35xh7UxCCLa9YgqA9hQuFLn5jrtxpgfDJQ=;
        b=v5iSd1JxnxNddzriGEBrfdsJhSznOTbd/FJxERjRKmmnUUq85cI+EqTbb4Hwz7PQGo
         uy4YmBN8aYXp3eDYIwwz4pBA2K2sKZInYRqKJYE1V2jjvKEQ/7v5icAhdj8EsHxm/HZH
         NlAnVe4KKVgbn6A5vuth2jpMFLNGLfM9HAbow=
In-Reply-To: <alpine.LNX.2.00.0909260748410.16303@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Curt, WE7U" <archer@eskimo.com>
Cc: Alan Crosswell <alan@columbia.edu>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

The OpenTracker+ RT works nicely in this role:
http://www.ve1fis.net/frankenrouter-1

99.44% of the credit for this goes to Chris Kantarjiev K9DBG:
http://www.dimebank.com/cak/k6dbg/k6dbg_igate.html

-Frank

On Sat, Sep 26, 2009 at 11:50 AM, Curt, WE7U <archer@eskimo.com> wrote:
> On Sat, 26 Sep 2009, Alan Crosswell wrote:
>
>> ... also as a replacement for TNC-based digipeaters such as Kantroni=
cs,
>> PacComm, etc. since the alternative right now is a normal PC rather =
than
>> a small appliance.
>
> Check out the ArgentData Tracker2 products...
>
> Or... =A0Throw a TNC-X or some other TNC in KISS mode onto one of the
> routers running OpenWRT plus the AX.25 stuff and you're good. =A0I
> have a couple of WRT-54GS wireless routers that are headed for
> serial port mods real soon now. =A0Each one will get two real serial
> ports and a firmware change.
>
> --
> Curt, WE7U. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <http://w=
ww.eskimo.com/~archer>
> =A0 APRS: =A0Where it's at! =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<h=
ttp://www.xastir.org>
> =A0Lotto: =A0A tax on people who are bad at math. - unknown
> Windows: =A0Microsoft's tax on computer illiterates. - WE7U.
> The world DOES revolve around me: =A0I picked the coordinate system!"
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
