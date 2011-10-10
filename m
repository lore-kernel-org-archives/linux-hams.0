From: Dave Platt <dplatt@radagast.org>
Subject: Re: packet radio gateway
Date: Mon, 10 Oct 2011 10:18:10 -0700
Message-ID: <4E9328D2.3010805@radagast.org>
References: <4E932538.5000805@kinfolk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E932538.5000805@kinfolk.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Richard B. Pyne" <rpyne@kinfolk.org>
Cc: linux-hams@vger.kernel.org

On 10/10/2011 10:02 AM, Richard B. Pyne wrote:
> I have been inactive in the world of packet radio for about ten years
> and am trying to get back involved. All of the "how-to" documentation I
> have been able to find regarding setting up a linux based AMPRnet
> gateway is at least 15 years old.
> 
> A group of us are trying to get an IP packet network up and running with
> the hope of being able to provide primarily email service to
> portable/mobile stations.
> 
> Any guidance will be greatly appreciated.

Take a look at what the Santa Clara County ARES/RACES group
has been doing.

The network consists of four Linux nodes running JNOS,
which provide standard AX.25-based mail service to client
systems in the field (city and county EOCs, mobile and
portable stations) and have a TCP/IP-based store-and-forward
message backbone.

The preferred client implementation is Outpost, an Outlook-
like email front-end.  This is, alas, Windows-based (although
I'm told it runs OK under some versions of WINE).

http://www.scc-ares-races.org/packet.html





