From: Roland Schwarz <roland.schwarz@blackspace.at>
Subject: Re: soundmodem bit rot prevention
Date: Mon, 29 Nov 2021 14:21:59 +0100
Message-ID: <4ec2cf0a-387b-775f-cd9e-4dce19bef1cf@blackspace.at>
References: <208413a5-c061-2008-0760-f4d4ed55fcdb@blackspace.at>
 <09fdc26a-0db0-4545-b655-9e4c9d5f56a0@www.fastmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <09fdc26a-0db0-4545-b655-9e4c9d5f56a0@www.fastmail.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org



On 29.11.21 at 12:59 Dave Hibberd wrote:
> ... what's the benefit of the feature?

The idea is to improve 9600 Bd operation for transceivers that have a 
bad low frequency response. The BLR should not get in your way if the 
transceiver already shows good performance.

Put it another way: You should see improvement on some equipment but no 
degradation on any.

Roland

-- 
__________________________________________
   _  _  | Roland Schwarz
  |_)(_  |
  | \__) | mailto:roland.schwarz@blackspace.at
________| http://www.blackspace.at
