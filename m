From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: ax.25 localhost?
Date: Sun, 22 Jul 2012 23:25:31 +0300
Message-ID: <500C61BB.4090103@sral.fi>
References: <20120721160848.GX17345@belle.intranet.vanheusden.com> <500ADCF8.5050505@boling.us> <500B1B52.8050705@sral.fi> <500B8DA9.5010803@boling.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <500B8DA9.5010803@boling.us>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Charles Boling (AD7UF)" <junk07+ham@boling.us>
Cc: linux-hams@vger.kernel.org

On 07/22/2012 08:20 AM, Charles Boling (AD7UF) wrote:
>
>> But I know that NET/ROM in Linux does support loopback. You can connect
>> to any NET/ROM service on your system from your system.
>
> How does that work?  If I try connecting to myself, I just get:
> 	axcall: NET/ROM callsign or alias not found
>
> I then tried adding myself into my own node list using nrparms, but
> since it wants an AX.25 device, we're back to the same problem; it calls
> out on that device and doesn't find itself.

Yeah, I noticed that it doesn't work with axcall (wow, it's been
a while since I last typed "modprobe netrom" ... :)

After taking a quick look, it seems that axcall has it's own
function for looking up the nodes, and it only looks at the
kernel netrom routing table (/proc/net/nr_nodes).

LinuxNode uses the libax25 find_node() function which also
includes any local running netrom interfaces to the list
of nodes. So right now I guess this netrom loopback thing
only works from within LinuxNode (netrom_call also seems
to work but it's bit of pain to use from command line
as it doesn't translate the EOLs...)

/Tomi

