From: "David S. Miller" <davem@redhat.com>
Subject: Re: [PATCH] set socket owner (ax25, rose, netrom)
Date: Sat, 30 Aug 2003 19:08:36 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030830190836.41064340.davem@redhat.com>
References: <20030829114208.40f10cca.shemminger@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030829114208.40f10cca.shemminger@osdl.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Hemminger <shemminger@osdl.org>
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@oss.sgi.com

On Fri, 29 Aug 2003 11:42:08 -0700
Stephen Hemminger <shemminger@osdl.org> wrote:

> AX25, NETROM, ROSE all need to set the socket owner field, otherwise it is possible
> to remove the module when there are orphaned sockets.

Applied, thanks.
