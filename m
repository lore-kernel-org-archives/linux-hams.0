From: =?utf-8?B?546L5pOO?= <wangqing@vivo.com>
Subject: RE: [PATCH V2 RESEND] net: hamradio: use time_is_after_jiffies()
 instead of open coding it
Date: Wed, 2 Mar 2022 02:58:33 +0000
Message-ID: <SL2PR06MB3082994522886A6E17C9D455BD039@SL2PR06MB3082.apcprd06.prod.outlook.com>
References: <1646188174-81401-1-git-send-email-wangqing@vivo.com>
 <20220301185506.64c3aa0a@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LaTGZLdREUj1aI8QyhfU51SnKc2VKKAKV5q6sBvMCM=;
 b=Gg6Shne+wSqaWmrkvmYkBEbmSlDXIOD3dD7ImAdDEx4L1xI2GhYrW+7X0dHUDHBFZ+2oP2j8Jxwr6tCD4ZiLitIKv+YbR2pJpUcVGYBF63l03Qj5tdZ/fPx5mTEqIEz92hVBPcuupLpga+wh+t/YSmoV6+aTcdvpY1rOw6Ay+Zg=
In-Reply-To: <20220301185506.64c3aa0a@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Language: zh-CN
List-ID: <linux-hams.vger.kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Joerg Reuter <jreuter@yaina.de>, "David S. Miller" <davem@davemloft.net>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

wqAKPj5PbiBUdWUswqAgMSBNYXIgMjAyMiAxODoyOTozMSAtMDgwMCBRaW5nIFdhbmcgd3JvdGU6
Cj4+IEZyb206IFdhbmcgUWluZyA8d2FuZ3FpbmdAdml2by5jb20+Cj4+IAo+PiBVc2UgdGhlIGhl
bHBlciBmdW5jdGlvbiB0aW1lX2lzX3tiZWZvcmUsYWZ0ZXJ9X2ppZmZpZXMoKSB0byBpbXByb3Zl
Cj4+IGNvZGUgcmVhZGFiaWxpdHkuCj4+IAo+PiBWMjoKPj4gYWRkIG1pc3NpbmcgIikiIGF0IGxp
bmUgMTM1NyB3aGljaCB3aWxsIGNhdXNlIGNvbXBsaWF0aW9uIGVycm9yLgo+Cj5JIHNlZSA6U8Kg
IFNvIHNpbmNlIHRoZSB2MSB3YXMgYWxyZWFkeSBhcHBsaWVkIGNvdWxkIHlvdSBwbGVhc2Ugc2Vu
ZCAKPmEgcGF0Y2ggdGhhdCBvbmx5IGFkZHMgdGhlIG1pc3NpbmcgYnJhY2tldCBiYXNlZCBvbiB0
aGlzIHRyZWU6Cj4KPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L25ldGRldi9uZXQtbmV4dC5naXQvCj4KPj8gV2UgY2FuJ3QgZGlzY2FyZCB0aGUgb2xkIHBh
dGNoLCB3ZSBuZWVkIGFuIGluY3JlbWVudGFsIGZpeC4KPgo+VGhhbmtzIQoKU3VyZSwgaXQncyBt
eSBtaXN0YWtlLg==
