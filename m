From: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: WARNING: bad unlock balance in __dev_queue_xmit
Date: Sat, 11 Jan 2020 15:38:19 -0800
Message-ID: <CAM_iQpWN-SKjjrG_7EQ-x+7UMiu6foaNWMJuwQuwN0BGmayB+A@mail.gmail.com>
References: <000000000000a06985059be4002e@google.com>
Mime-Version: 1.0
Return-path: <bridge-bounces@lists.linux-foundation.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c7HFrOGQ3phE12eoMeyUfOtwv87GN61OlvlGebweSPE=;
 b=CUzzXi3uv6xXm/4UnggMbWvrrN2Up+aCdXgbjG6cA1RSh2Hsl7MaJGyUzdoMoTmd4R
 ZrHmzvSIQzS9GFymrJPYSFUJoVbzF0PJ/iecYAh4HGcrfH/zwmd4F6x9nsoOeailYobC
 MujffRFXqGvkpsurYLOjgR9qmZoZeeEk+kwuIIysdTEHyy0eM0MPpC10Mh0InyVmHn1v
 5FsP+pOKLqj3MpjEbbWZWOZEilHIuIlxKrmee02exZm69I3xF9XolTxJTNhKMd4CPNUr
 7TK8yRsQode2rHqJa9VpU78VxSiyf+Oi7TyRFsjn5WlXmrtjazYZe5Wjb+yrJwuo7Mdn
 THlQ==
In-Reply-To: <000000000000a06985059be4002e@google.com>
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/bridge>, 
 <mailto:bridge-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/bridge/>
List-Post: <mailto:bridge@lists.linux-foundation.org>
List-Help: <mailto:bridge-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/bridge>,
 <mailto:bridge-request@lists.linux-foundation.org?subject=subscribe>
Errors-To: bridge-bounces@lists.linux-foundation.org
Sender: "Bridge" <bridge-bounces@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: syzbot <syzbot+ad4ea1dd5d26131a58a6@syzkaller.appspotmail.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, andrew@lunn.ch, Alexander Aring <alex.aring@gmail.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, ast@domdv.de, linmiaohe@huawei.com, gustavo@embeddedor.com, oss-drivers@netronome.com, linux-wireless <linux-wireless@vger.kernel.org>, a@unstable.cc, linux-hyperv@vger.kernel.org, Linux Kernel Network Developers <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-hams <linux-hams@vger.kernel.org>, kys@microsoft.com, Marek Lindner <mareklindner@neomailbox.ch>, Florian Fainelli <f.fainelli@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, bridge@lists.linux-foundation.org, jwi@linux.ibm.com, linux-wpan@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Paolo Abeni <pabeni@redhat.com>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>, Marcel Holtmann <marcel@holtmann>

#syz dup: WARNING: bad unlock balance in sch_direct_xmit
