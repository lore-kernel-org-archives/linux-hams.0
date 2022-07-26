From: duoming@zju.edu.cn
Subject: Re: [PATCH net] netrom: fix sleep in atomic context bugs in timer
 handlers
Date: Tue, 26 Jul 2022 11:20:25 +0800 (GMT+08:00)
Message-ID: <14bac17c.5d665.182388522da.Coremail.duoming@zju.edu.cn>
References: <20220723035646.29857-1-duoming@zju.edu.cn>
 <20220725194930.44ca1518@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20220725194930.44ca1518@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

SGVsbG8sCgpPbiBNb24sIDI1IEp1bCAyMDIyIDE5OjQ5OjMwIC0wNzAwIEpha3ViIEtpY2luc2tp
IHdyb3RlOgoKPiBPbiBTYXQsIDIzIEp1bCAyMDIyIDExOjU2OjQ2ICswODAwIER1b21pbmcgWmhv
dSB3cm90ZToKPiA+IEZpeGVzOiBlYWZmZjg2ZDNiZDggKCJbTkVUUk9NXTogVXNlIGttZW1kdXAi
KQo+IAo+IFRoYXQncyBub3QgYSBjb3JyZWN0IEZpeGVzIHRhZywgYWNtZSBqdXN0IHN3YXBwZWQg
a21hbGxvYyBmb3Iga21lbWR1cCgpLgo+IFRoZSBhbGxvY2F0ZSBmbGFncyBkaWQgbm90IGNoYW5n
ZS4KClRoYW5rcyBmb3IgeW91ciB0aW1lIGFuZCByZXBseSEKClRoZSBjb3JyZWN0IEZpeGVzIHRh
ZyBpcyAiRml4ZXM6IDFkYTE3N2U0YzNmNCAoIkxpbnV4LTIuNi4xMi1yYzIiKSIuClRoZSBmb2xs
b3dpbmcgaXMgdGhlIGNvZGU6CgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Mi42
LjEyLXJjMi9zb3VyY2UvbmV0L25ldHJvbS9ucl9yb3V0ZS5jI0wxNTgKCi4uLgppZiAoKG5yX25l
aWdoLT5kaWdpcGVhdCA9IGttYWxsb2Moc2l6ZW9mKCpheDI1X2RpZ2kpLCBHRlBfS0VSTkVMKSkg
PT0gTlVMTCkgewouLi4KCkJlc3QgcmVnYXJkcywKRHVvbWluZyBaaG91CgoK
