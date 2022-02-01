From: =?UTF-8?B?5ZGo5aSa5piO?= <22021233@zju.edu.cn>
Subject: Re: Re: [PATCH 2/2] ax25: add refcount in ax25_dev to avoid UAF
 bugs
Date: Tue, 1 Feb 2022 14:26:23 +0800 (GMT+08:00)
Message-ID: <70763230.8debd.17eb3f680eb.Coremail.22021233@zju.edu.cn>
References: <cover.1643343397.git.duoming@zju.edu.cn>
 <855641b37699b6ff501c4bae8370d26f59da9c81.1643343397.git.duoming@zju.edu.cn>
 <20220131173729.GN1951@kadam>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20220131173729.GN1951@kadam>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-hams@vger.kernel.org, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

VGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciB0aW1lIGFuZCBwb2ludGluZyBvdXQgcHJvYmxl
bXMgaW4gbXkgcGF0Y2guCgpUaGUgZGVjcmVtZW50IG9mIGF4MjVfYmluZCgpIGlzIGluIGF4MjVf
a2lsbF9ieV9kZXZpY2UoKS4gSWYgd2UgZG9uJ3QKY2FsbCBheDI1X2JpbmQoKSBiZWZvcmUgYXgy
NV9raWxsX2J5X2RldmljZSgpLCB0aGUgYXgyNV9saXN0IHdpbGwgYmUKZW1wdHkgYW5kIGF4MjVf
ZGV2X3B1dCgpIGluIGF4MjVfa2lsbF9ieV9kZXZpY2UoKSB3aWxsIG5vdCBleGVjdXRlLgoKPiBA
QCAtOTEsNiArOTEsNyBAQCBzdGF0aWMgdm9pZCBheDI1X2tpbGxfYnlfZGV2aWNlKHN0cnVjdCBu
ZXRfZGV2aWNlICpkZXYpCj4gIAkJCXNwaW5fdW5sb2NrX2JoKCZheDI1X2xpc3RfbG9jayk7Cj4g
IAkJCWxvY2tfc29jayhzayk7Cj4gIAkJCXMtPmF4MjVfZGV2ID0gTlVMTDsKPiArCQkJYXgyNV9k
ZXZfcHV0KGF4MjVfZGV2KTsKPiAgCQkJcmVsZWFzZV9zb2NrKHNrKTsKPiAgCQkJYXgyNV9kaXNj
b25uZWN0KHMsIEVORVRVTlJFQUNIKTsKPiAgCQkJc3Bpbl9sb2NrX2JoKCZheDI1X2xpc3RfbG9j
ayk7CgpJIHdpbGwgc2VuZCB0aGUgaW1wcm92ZWQgcGF0Y2ggYXMgc29vbiBhcyBwb3NzaWJsZS4K
CgpCZXN0IHdpc2hlcywKRHVvbWluZyBaaG91Cg==
