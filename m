From: Jeroen <pe1rxq@gate.vitsch.net>
Subject: Re: Red Hat 9.0
Date: Mon, 16 Feb 2004 15:48:35 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200402161448.i1GEmZ8Y019631@gate.vitsch.net>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cristiano.Tavares@simoldesplasticos.pt, linux-hams@vger.kernel.org

Hi,

You probably get a panic because the kernel can't find the root filesystem...
The root directory is not needed for a kernel.
Did you add support for the filesystem your root is using/?
E.g. isf you use reiserfs for your root system you have to make a kernel
that supports it.

Jeroen
