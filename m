From: "Claudieni" <pu2nzw@bol.com.br>
Subject: RE: gMFSK and my wonky PTT driver
Date: Sat, 23 Jul 2005 20:16:15 -0300
Message-ID: <20050723231616.20A277768@sankara1.bol.com.br>
References: <40764501050719150178c80167@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40764501050719150178c80167@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jonathan Lassoff' <jlassoff@gmail.com>, linux-hams@vger.kernel.org

Hi Jonathan 


Did you tried to load the module with those parameters?



insmod parport

insmod parport_pc io=0x378 irq=7 



Claudinei
Pu2nzw

