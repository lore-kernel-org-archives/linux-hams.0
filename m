From: "Reshetova, Elena" <elena.reshetova@intel.com>
Subject: RE: [PATCH 16/16] drivers, net, intersil: convert
 request_context.refcount from atomic_t to refcount_t
Date: Tue, 4 Apr 2017 10:07:55 +0000
Message-ID: <2236FBA76BA1254E88B949DDB74E612B41C8741B@IRSMSX102.ger.corp.intel.com>
References: <1490691403-4016-1-git-send-email-elena.reshetova@intel.com>
 <1490691403-4016-17-git-send-email-elena.reshetova@intel.com>
 <87zifxn2gb.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hAtQIN3hvajlEHThGvLUMOtlRuW6IriUG3vYy91GmjQ=; b=Qe4LdOvDXjitxv
	kQkzzISz4igJrCHk6je54Di2Nmvermiz0Z45EpYLe8DbG+EWvsxjCsJzrDxC62HrvggXQRdTM53+d
	drpjb6GXSvlGzif4L9lXfvDKOPUT4V/XJcGsOtZGMrd2Kw0X6bRmCQx157ZD7fjBZzS6WJ7FZxDbl
	pmz7XfyPwZOyNTAGXAaRoR7YzwOGupGIBzE5MlI0nrDG1CwfMcmwlTUPcoR0u8CmKve/uvfjBrhe2
	Yj9OkB//tw7YInd3IS+tVkXYtx7NIV/JaTfqAXFzrT0785JuhEYTcyDVxNm1gaZLPc5CgETU8akf2
	Ti+wF8KE2GTRo1Z7y9rQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=intel;
 t=1491300594; x=1522836594;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wRoRYLqKc/qmBQ2/jVkm9WMOgwTVFphjEzDo1wDqp5M=;
 b=A+u/zzRVf3Dfc6/rgf72DqZ/tSwBv3AOMtiTW91U09QgaqHXgsB5ST94
 a1ffdu3kb6+kMCMyjGe0WE//cAzTiA==;
In-Reply-To: <87zifxn2gb.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "peterz@infradead.org" <peterz@infradead.org>, "matanb@mellanox.com" <matanb@mellanox.com>, "paulus@samba.org" <paulus@samba.org>, "nbd@openwrt.org" <nbd@openwrt.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "saeedm@mellanox.com" <saeedm@mellanox.com>, "ganeshgr@chelsio.com" <ganeshgr@chelsio.com>, Hans Liljestrand <ishkamiel@gmail.com>, David Windsor <dwindsor@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "j@w1.fi" <j@w1.fi>, "ajk@comnets.uni-bremen.de" <ajk@comnets.uni-bremen.de>, "leonro@mellanox.com" <leonro@mellanox.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "blogic@openwrt.org" <blogic@openwrt.org>, netdev@vger.kernel.org


> Elena Reshetova <elena.reshetova@intel.com> writes:
> 
> > refcount_t type and corresponding API should be
> > used instead of atomic_t when the variable is used as
> > a reference counter. This allows to avoid accidental
> > refcounter overflows that might lead to use-after-free
> > situations.
> >
> > Signed-off-by: Elena Reshetova <elena.reshetova@intel.com>
> > Signed-off-by: Hans Liljestrand <ishkamiel@gmail.com>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: David Windsor <dwindsor@gmail.com>
> > ---
> >  drivers/net/wireless/intersil/orinoco/orinoco_usb.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> The prefix should be "orinoco_usb:", I'll fix that.

Thanks for both! Will you take the patches in?

Best Regards,
Elena.

> 
> --
> Kalle Valo
