From: Ken Moore <vk4akm@irock.com.au>
Subject: Re: Broadcasting unwanted UDP etc.
Date: Thu, 20 Apr 2006 09:29:30 +1000
Message-ID: <4446C7DA.4050005@irock.com.au>
Reply-To: vk4akm@wia.org.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Thanks Brett,

The verbose command (iptables -vL OUTPUT) did show that the sm0 port was 
being blocked.
So it appears that the iptables rule is the way to go after all.

Thanks to all for their input, I now realize this was not strictly a Ham 
matter, but it was affecting my packet system and I was not sure which 
way to go.

"So much to learn, so little time."

-- 
Regards - Ken VK4AKM
          Yeppoon, Queensland
          -= Use Open Source Software =-
                 GNU\Linux Debian.


