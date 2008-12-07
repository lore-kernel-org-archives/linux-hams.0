From: "Daniel Perup" <daniel@perup.net>
Subject: Re: [Hamlib-developer] [ANN] Hamlib 1.2.8 released
Date: Sun, 7 Dec 2008 21:49:10 +0100
Message-ID: <5659421a0812071249w628a4e3cq1a32165e11bf8643@mail.gmail.com>
References: <20081103211757.GJ12042@charybde.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=fHvfZCYsq8I+1EDqoMkORqewsHJwLuOVHnkLb4P+4xs=;
        b=Zr41NTJlfjiM9lihpqb6I/YjcZdI10EncKYjdmq5llebW0Pegg27b8tX/RUjijQqQm
         +T6dgJMclp8zsMzYUBpeqa4XO0hY037t6QlDVuB1NF7nVRk/jxR3Fxt8omU6quQcgDgn
         47V41AbxvPpWqRMpI5sIIds60V+kQ/ih/ffiI=
In-Reply-To: <20081103211757.GJ12042@charybde.local>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hamlib developers <hamlib-developer@lists.sourceforge.net>, Linux HAMs <Linux-hams@vger.kernel.org>

Hi,

This is great news, though I have tried to use the 1.2.8 version with
my FT-950, without success. My FT-897 works as it should.

My problem is that when I try to send some command I get this:

---8<---

Rig command: m
read_string: timedout without reading a character
get_mode: error = Communication timed out

---8<---

I use the correct port and speed, verfied to work with the FT-897. The
FT-950 is configured to use the same port speed.

Thanks for any help!

       SA5AQO Daniel

2008/11/3 Stephane Fillod <f8cfe@free.fr>:
> Good news everyone!
>
> Hamlib-1.2.8 has been released.
>
> Hamlib provides a unified environment for the development of radio and
> rotator control applications. The release 1.2.8 includes many
> improvements since last official version.
>
> Check it out at http://hamlib.org !
>
> New in 1.2.8:
> * New models: BC235, BC250, BC780, PRO-2052,
>  BCD396T, BCD996T, K3, FT950
> * New pseudo models: netrigctl/netrotctl, backends ala
>  rpcrig/rpcrot, but based on rigctld/rotctld
> * New rotator backend: GS232A, PcRotor
> * Removed microtune backend
> * Fixes: DttSP, IC-275, IC-475, IC-725, IC-735, IC-756PRO,
>  IC-761, IC-775, IC-781, IC-706*, Kenwood TH/TM models, Orion,
>  BC245, BC895, FT-100, FT757GX, FT-857, FT-897, FT-920
> * Numerous bindings fixes, esp. for memory channel works
> * New commands available in rigctl
> * New rotctld to go with rigctld rig daemon.
>  The protocol changed, but there's the compatibility
>  option -e to pass to the daemon for previous protocol.
>
>
> Download pages are accessible at http://sourceforge.net/projects/hamlib
> rpms, .deb and Win32 DLL's coming soon (MinGW32 build needs a fix)
>
> Please, test it out and report to hamlib-developer@lists.sourceforge.net
> Developers are also invited to join the Hamlib team by subscribing to
> this mailing list. If your favorite rig is not in the supported list,
> feel free to ask. We need more beta-testers, so all the backends can
> reach the stable and fully supported state.
>
> Many thanks to all the developers and testers who participated
> in this release, and esp. to the ARRL for giving access to rigs.
> Contributors and backend maintainers are listed in the AUTHORS file.
>
> Have fun and let us know!
>
> 73's de Stephane - F8CFE & the Hamlib team
>
> -------------------------------------------------------------------------
> This SF.Net email is sponsored by the Moblin Your Move Developer's challenge
> Build the coolest Linux based applications with Moblin SDK & win great prizes
> Grand prize is a trip for two to an Open Source event anywhere in the world
> http://moblin-contest.org/redirect.php?banner_id=100&url=/
> _______________________________________________
> Hamlib-developer mailing list
> Hamlib-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/hamlib-developer
>
