From: =?UTF-8?B?5ZGo5aSa5piO?= <duoming@zju.edu.cn>
Subject: Re: Re: [PATCH V3] ax25: Fix refcount leaks caused by ax25_cb_del()
Date: Sun, 13 Mar 2022 12:26:45 +0800 (GMT+08:00)
Message-ID: <4364e68e.77f.17f81875881.Coremail.duoming@zju.edu.cn>
References: <20220311014624.51117-1-duoming@zju.edu.cn>
 <20220311105344.GI3293@kadam>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20220311105344.GI3293@kadam>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jreuter@yaina.de, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org

SGVsbG8sCgpPbiBGcmksIE1hciAxMSwgMjAyMiBEYW4gQ2FycGVuIHdyb3RlOgoKPiBCdXQgZXZl
biBoZXJlLCBteSBpbnN0aW5jdCBpcyB0aGF0IGlmIHRoZSByZWZjb3VudGluZyBpcyB3ZXJlIGRv
bmUgaW4KPiB0aGUgY29ycmVjdCBwbGFjZSB3ZSB3b3VsZCBub3QgbmVlZCBhbnkgYWRkaXRpb25h
bCB2YXJpYWJsZXMuICBJcyB0aGVyZQo+IG5vIHNpbXBsZXIgc29sdXRpb24/CgpJIHNlbnQgIltQ
QVRDSCBuZXQgVjIgMS8yXSBheDI1OiBGaXggcmVmY291bnQgbGVha3MgY2F1c2VkIGJ5IGF4MjVf
Y2JfZGVsKCkiCm9uIE9uIEZyaSwgTWFyIDExLCAyMDIyLiBDb3VsZCB0aGlzIHBhdGNoIHNvbHZl
IHlvdXIgcXVlc3Rpb24/CgpCZXN0IHdpc2hlcywKRHVvbWluZyBaaG91CgoK
