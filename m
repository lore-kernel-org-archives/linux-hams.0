From: Thomas Sailer <sailer@scs.ch>
Subject: Re: ANN: UKW Tools 0.3.2 released
Date: Wed, 10 Mar 2004 18:42:09 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <404F5371.4070704@scs.ch>
References: <dFemtxAWHhTAFwRT@mechserv.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <dFemtxAWHhTAFwRT@mechserv.demon.co.uk>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Naylor <jonathan@mechserv.demon.co.uk>
Cc: linux-hams@vger.kernel.org

Jonathan Naylor wrote:

> PS does anyone know where I can get the source code for a soft decision 
> Reed Solomon decoder ?

Soft decision decoding of block codes is hard to do efficiently. In fact I don't
know any algorithm that does it efficiently. That's why normally a convolutional code
is used as inner code 8-)

Tom

