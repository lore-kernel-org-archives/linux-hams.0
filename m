From: oz6bl@amsat.dk
Subject: Re: Afternoon.
Date: Mon, 22 Aug 2005 14:44:43 -0000 (UTC)
Message-ID: <32855.83.73.68.20.1124721883.squirrel@www.amsat.dk>
References: <1538538E-F9B4-497A-8E02-68B1ACBAC40C@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1538538E-F9B4-497A-8E02-68B1ACBAC40C@tssg.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Ronan <jronan@tssg.org>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

Hi John,

John Ronan wrote:
> I was just wondering,
>
> What are people using to do doppler correction for satellite
> stations?

Here at OZ7SAT we use some homebrew Linux SW to control our IC-821 and
IC-910. It gets the information from a Predict server and uses the CT-V
interface to tell the radio what to do. Our PCs are synchronized to
network time with NTP and we 'force-feed' the frequencies to the radio. It
works beautifully. The IC-910 is said to be able to track the satellite
using its AFC function, but we havn't implemented that yet.

Best 73 de Bent/OZ6BL

