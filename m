From: Dennis Boone <drb@msu.edu>
Subject: Re: AX.25 Linux Packet Forwarding
Date: Sun, 27 Mar 2022 20:25:06 -0400
Message-ID: <20220328002508.6C25E12EB5@yagi.h-net.msu.edu>
References: <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Sun, 27 Mar 2022 20:18:11 -0400.)
             <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com>
Content-ID: <41904.1648427106.1@yagi.h-net.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > I'd like to set up my Linux box attached to my base station to
 > forward AX.25 traffic on-frequency as a relay.

 > HT: "K3XEC-1" (Kenwood)
 > Base Station: "MYRELAY" (Yaesu)
 > Remote Station: "MYBBS"

The linux stack doesn't digipeat on its own.  There are a couple of
variants of a digi program that will add the needful.  One such is:

https://github.com/iddq/axdigi2018

All of them seem to be updates of Craig Small's original axdigi tool.

De
