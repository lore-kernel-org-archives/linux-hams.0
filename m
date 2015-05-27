From: Miroslav Skoric <skoric@uns.ac.rs>
Subject: Re: Linpac 0.21 (AX.25 packet radio application) posted
Date: Wed, 27 May 2015 18:11:09 +0200
Message-ID: <5565EC9D.6060604@uns.ac.rs>
References: <5563611F.5020204@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5563611F.5020204@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>, Linux Hams <linux-hams@vger.kernel.org>

On 05/25/2015 07:51 PM, David Ranch wrote:

>
> LinPac is an Ncurses based AX.25 packet radio terminal for use with
> Linux's native AX.25 stack.  It mimics many of the feature packed
> HOST-MODE programs that used to exist for Dos (PkGold, etc) but with any
> TNC running in KISS mode. It allows wide configuration and easy addition
> of new functions and special functions needed by the user. It's intended
> for keyboard-to-keyboard use but also supports receiving basic PBBS
> messages, local Converse-link chat rooms, basic node commands like
> mheard and making outgoing connections, etc.
>

Hi David & others,

It makes me wonder if LinPac has (or maybe will have) a feature that 
allows it running as a 'client' application in the same box where a 
packet server (such as xfbbd) is already running 'on top' of the AX.25 
stack.

For example, if I recall properly, there was a WinPac end-user software 
for Win$$$ that was able to use WinBPQ (BPQ32) as an intermediate level 
for accessing WinFBB running in the same box. If I am not wrong, BPQ32 
allowed more than one application to run on it in parallel, but I do not 
know if the same approach would be feasible with the native AX.25 stack. 
In fact, what I want to do is to mimic real client-to-server 
communication as if a real packet network is present. Any idea?

Misko

