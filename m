From: Riley Williams <rhw@MemAlpha.cx>
Subject: Re: Predict 2.1.5
Date: Sat, 20 Apr 2002 23:25:41 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0204202313480.22444-100000@Consulate.UFP.CX>
References: <0204201920200F.00773@g4klx>
Reply-To: Riley Williams <rhw@InfraDead.Org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0204201920200F.00773@g4klx>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Naylor <jonathan.naylor@ggaweb.ch>
Cc: Linux Ham Radio <linux-hams@vger.kernel.org>

Hi Jonathan.

> I downloaded Predict 2.1.5 today to have a look at an alternative to
> my own mtrack program (shameless plug). In many ways it is excellent
> and does things that my own program does not do, however as an
> active AO-40 user I have to say that there a few things that the
> program needs in order to satisfy a phase 3 user:

Here's my comments on yours...

> 1. Satellite attitude, known as ALON/ALAT and is extremely important
>    with predicting usability of the satellite. The antenna
>    off-pointing is a very serious business.

Very true, and that's something that needs adding to the calculation
engine itself if I understand it correctly.

> 2. Doppler shift on other than 2m and 70cms. AO-40 uses 2401 MHz for
>    the downlink and uplinks are on 435 MHz and 1269 MHz. Also there
>    is a downlink on 24 GHz where the doppler is not inconsequential
>    and signals are weak.

That's a function of the display programs, and the current aim is to
make the prediction engine a separate server from the display server,
although there are certain problems with doing that.

The prediction engine supplies the normalised doppler for a 100 MHz
signal, and it is the job of the display programs to convert that to the
desired frequency before displaying it.

> 3. Modes. The program displays the MA in the 0-255 fashion, but it
>    would also be nice to program modes so that you can see at a
>    glance which is in operation. Some satellites (Fuji series) base
>    mode selection on the day of the week instead.

Three comments regarding this:

 1. The program displays the MA in both 0-255 and 0-359 fashion at
    the moment. You appear to have overlooked that.

 2. Whilst display of the current mode would be useful, the details
    of the parameters for the various modes just aren't included in
    the TLE's themselves, and as far as I am aware, there is no
    standardised format and site from which suchlike information
    could be automatically downloaded.

 3. When the information has to be entered by the user, one has to
    assume that the user already knows the information before they
    enter it in to the system.

Best wishes from Riley.

