From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Dekoding encap.txt to routing for JNOS
Date: Sun, 23 Mar 2003 17:04:40 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030323170440.A24193@pull.privacy.nb.ca>
References: <000901c2f0a6$c71402d0$6400000a@gw.sp1lop.szczecin.pl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000901c2f0a6$c71402d0$6400000a@gw.sp1lop.szczecin.pl>; from sp1lop@gw.sp1lop.szczecin.pl on Sat, Mar 22, 2003 at 08:10:54PM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Janusz Przybylski - SP1LOP <sp1lop@gw.sp1lop.szczecin.pl>
Cc: linux-hams@vger.kernel.org

On Sat, Mar 22, 2003 at 08:10:54PM +0100, Janusz Przybylski - SP1LOP wrote:
> 
> Routingu used in encap format.txt it is not peaceable with my format
> routingu
> and then example:
> encap.txt
> route addprivate 44.165.25/24 encap 80.48.10 5.183
> 
> and this routing:
> ip route add 44.165.25/25 via 80.48.10 5.183 dev tunl0 onlink
> 
> this exemplifies from utilization my data.

If I understand your request correctly, you wish to use the encap.txt
file for building IPIP encapsulation routes under Linux using iproute2.

If so, then I have some scripts that should help you.
http://www.mctaylor.com/ve1mct/ampr_gateways.tar.gz
 
I hope that is useful for you.

-ve1mct
