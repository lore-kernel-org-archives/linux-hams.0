From: Waldemar Ogonowski <Waldemar.Ogonowski@GTservices.pl>
Subject: Re: JNOS/ Linux
Date: Thu, 24 Jul 2003 09:25:28 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200307240925.28316.Waldemar.Ogonowski@GTservices.pl>
Reply-To: Waldemar.Ogonowski@GTservices.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

OK I found my problem. It was in config.h. I have to much remove options. When 
undefine statuswin and statuswincmd JNOS don't want compiled. 
After define this options not problem compile JNOS.

Thanks for any information

Waldek sp2ong 


