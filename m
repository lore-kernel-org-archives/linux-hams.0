From: "David S. Miller" <davem@redhat.com>
Subject: Re: [PATCH] missing spin_unlock and recvmsg fix
Date: Wed, 31 Dec 2003 10:36:17 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031231103617.02c5db8f.davem@redhat.com>
References: <20031231170647.C3527@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20031231170647.C3527@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org

On Wed, 31 Dec 2003 17:06:47 +0100
Jeroen Vreeken <pe1rxq@amsat.org> wrote:

> This is a small patch for two ax25 problems:
> - A missing spin_unlock.
> - recvmsg was reporting the destination address instead of the source
> address.
>  (and I really want recvfrom() and not recvto() :)

Applied, thanks Jeroen.
