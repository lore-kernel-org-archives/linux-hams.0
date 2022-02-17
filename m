From: =?UTF-8?B?5ZGo5aSa5piO?= <duoming@zju.edu.cn>
Subject: Re: Re: [PATCH] drivers: hamradio: 6pack: fix UAF bug caused by
 mod_timer()
Date: Thu, 17 Feb 2022 10:47:44 +0800 (GMT+08:00)
Message-ID: <cbb5412.b171f.17f05941412.Coremail.duoming@zju.edu.cn>
References: <20220216023549.50223-1-duoming@zju.edu.cn>
 <20220215203955.7d7a3eed@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20220215203955.7d7a3eed@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-hams@vger.kernel.org, ajk@comnets.uni-bremen.de, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

SGVsbG8sCgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHRpbWUgYW5kIHBvaW50aW5nIG91
dCBwcm9ibGVtcyBpbiBteSBwYXRjaC4KSSBoYXZlIHNlbnQgdGhlIG1vZGlmaWVkIHBhdGNoIGFn
YWluIGp1c3Qgbm93LgoKV2UgdXNlIHB0eSB0byBzaW11bGF0ZSA2cGFjayBkZXZpY2UsIHRoZSBy
ZWxlYXNlZCByZXNvdXJjZSBpcyB0dHlfc3RydWN0LT50dHlfcG9ydAppbiB0dHkgbGF5ZXIuIAoK
VGhlIGZyZWUgdHJhY2UgaXMgc2hvd24gYXMgYmVsb3c6CnR0eV9yZWxlYXNlKCktPnR0eV9yZWxl
YXNlX3N0cnVjdCgpLT5yZWxlYXNlX3R0eSgpLT50dHlfa3JlZl9wdXQoKS0+CnF1ZXVlX3JlbGVh
c2Vfb25lX3R0eSgpLT5yZWxlYXNlX29uZV90dHkoKS0+cHR5X2NsZWFudXAoKS0+dHR5X3BvcnRf
cHV0KHR0eS0+cG9ydCk7CgpUaGUgdXNlIHRyYWNlIGlzIHNob3duIGFzIGJlbG93OgpzcF94bWl0
X29uX2FpcigpLT5wdHlfd3JpdGUoKS0+dHR5X2ZsaXBfYnVmZmVyX3B1c2goKS0+dHR5X3NjaGVk
dWxlX2ZsaXAocG9ydCk7CgoKQmVzdCB3aXNoZXMsCkR1b21pbmcgWmhvdQoK
