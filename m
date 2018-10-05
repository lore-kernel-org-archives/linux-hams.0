From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] yam: fix a missing-check bug
Date: Fri, 05 Oct 2018 11:55:21 -0700 (PDT)
Message-ID: <20181005.115521.804633180942667200.davem@davemloft.net>
References: <1538755176-22355-1-git-send-email-wang6495@umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538755176-22355-1-git-send-email-wang6495@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: wang6495@umn.edu
Cc: kjlu@umn.edu, jpr@f6fbb.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Wenwen Wang <wang6495@umn.edu>
Date: Fri,  5 Oct 2018 10:59:36 -0500

> In yam_ioctl(), the concrete ioctl command is firstly copied from the
> user-space buffer 'ifr->ifr_data' to 'ioctl_cmd' and checked through the
> following switch statement. If the command is not as expected, an error
> code EINVAL is returned. In the following execution the buffer
> 'ifr->ifr_data' is copied again in the cases of the switch statement to
> specific data structures according to what kind of ioctl command is
> requested. However, after the second copy, no re-check is enforced on the
> newly-copied command. Given that the buffer 'ifr->ifr_data' is in the user
> space, a malicious user can race to change the command between the two
> copies. This way, the attacker can inject inconsistent data and cause
> undefined behavior.
> 
> This patch adds a re-check in each case of the switch statement if there is
> a second copy in that case, to re-check whether the command obtained in the
> second copy is the same as the one in the first copy. If not, an error code
> EINVAL will be returned.
> 
> Signed-off-by: Wenwen Wang <wang6495@umn.edu>

Applied, thanks.
