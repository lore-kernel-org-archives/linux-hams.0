From: Phil <phillor@telstra.com>
Subject: Re: 300bps Packet
Date: Thu, 25 Nov 2010 11:51:18 +1000
Message-ID: <201011251151.18112.phillor@telstra.com>
References: <4CEB5074.2070008@complete.org> <201011241651.42670.phillor@telstra.com> <4CED0743.7000107@complete.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CED0743.7000107@complete.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Wed, 24 Nov 2010 10:38:27 pm John Goerzen wrote:
> On 11/24/2010 12:51 AM, Phil wrote:
> > On Tue, 23 Nov 2010 03:26:12 pm you wrote:

<cut>

> Hi Phil,
> 
> That's good to know, but I must admit I don't know how to make it work.
>   Can you elaborate on what parameters you tuned, and how you found the
> appropriate values for them?  Maybe even a copy of your config file?
> 

Hello again John,

The following is from the HF section of my soundmodem config file. It's been 
awhile since I've played with 300 baud packet but I just tried the call 
function and it still generates the familiar 300 baud tones.

[phil@localhost ax25]$ more soundmodem.conf
<?xml version="1.0"?>
<modem>
  <configuration name="hf_packet">
    <channel name="Channel 0">
      <mod mode="afsk" bps="300" f0="900" f1="1100" diffenc="1"/>
      <demod mode="afsk" bps="300" f0="900" f1="1100" diffdec="1"/>
      <pkt mode="MKISS" ifname="sm0" hwaddr="VK4BVM-2" ip="10.0.0.1" 
netmask="255.255.255
.0" broadcast="10.0.0.255"/>

-- 
Regards,
Phil
