From: "David S. Miller" <davem@redhat.com>
Subject: Re: [PATCH] ax25 Locking fix
Date: Fri, 13 Feb 2004 21:33:50 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040213213350.7d15fbcd.davem@redhat.com>
References: <20040213234806.J220@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040213234806.J220@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org

On Fri, 13 Feb 2004 23:48:06 +0100
Jeroen Vreeken <pe1rxq@amsat.org> wrote:

> This is a oneliner for 2.6 changing an unlock into a lock.
> This prevents an oops on removal of the ax25 module.

Durrr, thanks for the fix Jeroen.

Patch applied.
