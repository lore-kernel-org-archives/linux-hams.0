From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [15/16] hostap: convert hostap_cmd_queue.usecnt from atomic_t to
 refcount_t
Date: Mon, 22 May 2017 15:24:55 +0000 (UTC)
Message-ID: <20170522152456.17EC860B7D@smtp.codeaurora.org>
References: <1490691403-4016-16-git-send-email-elena.reshetova@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvju+HZcMSrQeJIEPGsSeq10VMO2VGeOXxa/YZL7Pyg=; b=OR5V5LpS1e/DmA
	8mds34+lnBl4bVeA+yvZ7chV0Zv7hhoW9oHK8toCq4UrZ8VO7+judf50X6OA8MPmFE70degRtDnDb
	9BRe/UWWWEQOJ/FoRMMUfn+Tvs5NqHrypKM7y5lEsqoGSHxJz4VRGzq2xti8CGqx5l7NItMBokG0C
	y7dh1NSq3/C1OgCAZcqHF7hOETasTcSHNZPbQLYOc34jyr578D+STSZUHY33SbRBh/oCcOrOG9zaG
	j/PCqQSzms9N79X55Ebx8IzqxEHGZz8QrhejG1w8Pjh1C9DxYSQMN5yHHxSzy50tE/6tlBvXM8noG
	/qYaB8IGfMDHn4UzMGjg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1495466696;
 bh=uwUgEBLr1hKKGsJHPHtKIpNl+L4nEzs+pranrlAn93M=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Mqeo7Fvmi2fKFVWIVizrihnX1GJfyi0FO5JgvzGuxP/1JY0zPpOTqLazU0X82aaBH
 dbbI9pBm2wIaQYjUtT2LvLGtwLGU4NX+giImG3xYHhi28YxE1Glc1IRiH4wytkO8O8
 cJM1bwuy2Po2p6jk40YRvsfzigLhpOgt9JMj98NU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1495466694;
 bh=uwUgEBLr1hKKGsJHPHtKIpNl+L4nEzs+pranrlAn93M=;
 h=Subject:From:In-Reply-To:References:To:Cc:From;
 b=VHXsdBq4IPGGZ+TA5WkfR70CzpTnCiERuiCB0AGfprmwQWRdLTItu6sL8QLw76qy8
 kNNyPZeFxTnyiv1on0jJDu/uhPQYnzEyHiKjySFVGGOh250ira2foM1F3rk5FD5mEn
 tKQMhAKMyYoretDtoYR+l68zacdoQkUs4AlI1mrI=
In-Reply-To: <1490691403-4016-16-git-send-email-elena.reshetova@intel.com>
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: gregkh@linuxfoundation.org, peterz@infradead.org, matanb@mellanox.com, paulus@samba.org, Elena Reshetova <elena.reshetova@intel.com>, nbd@openwrt.org, linux-rdma@vger.kernel.org, saeedm@mellanox.com, ganeshgr@chelsio.com, Hans Liljestrand <ishkamiel@gmail.com>, David Windsor <dwindsor@gmail.com>, keescook@chromium.org, j@w1.fi, ajk@comnets.uni-bremen.de, leonro@mellanox.com, matthias.bgg@gmail.com, linux-hams@vger.kernel.org, linux-arm-kernel@lists.infradead.org, blogic@openwrt.org, netdev@vger.kernel.org, yishaih@mellanox.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org

Elena Reshetova <elena.reshetova@intel.com> wrote:
> refcount_t type and corresponding API should be
> used instead of atomic_t when the variable is used as
> a reference counter. This allows to avoid accidental
> refcounter overflows that might lead to use-after-free
> situations.
> 
> Signed-off-by: Elena Reshetova <elena.reshetova@intel.com>
> Signed-off-by: Hans Liljestrand <ishkamiel@gmail.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: David Windsor <dwindsor@gmail.com>

2 patches applied to wireless-drivers-next.git, thanks.

552aa585faff hostap: convert hostap_cmd_queue.usecnt from atomic_t to refcount_t
0aeffa7041d8 orinoco_usb: convert request_context.refcount from atomic_t to refcount_t

-- 
https://patchwork.kernel.org/patch/9648427/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
