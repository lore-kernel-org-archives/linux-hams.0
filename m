From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: AX25 Coding Question
Date: Fri, 12 Jul 2002 20:42:59 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020712104259.GA30938@silly.cloud.net.au>
References: <20020711175948.19313.h014.c002.wm@mail.peoplepc.com.criticalpath.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020711175948.19313.h014.c002.wm@mail.peoplepc.com.criticalpath.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, Jul 11, 2002 at 05:59:47PM -0700, TIMOTHY POWELL wrote:
> I want to write a packet-monitoring program in Java on
> my Linux box.  But I can?t find out how to receive the
> ax25 packet frames from the kernel.  I have come to the
> conclusion though that I will have to use Java?s Native
> Interface (JNI) capability to receive the packets,
> which means I?ll end up coding part of the project in
> C++.  Where can I find documentation on receiving the
> ax25 packet frames from the kernel and some C or C++
> coding examples?  

The easiest way is to look at the source code for listen
from ax25-tools.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
