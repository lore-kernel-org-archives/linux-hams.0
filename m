From: Ken Moore <vk4akm@irock.com.au>
Subject: Re: Broadcasting unwanted UDP messages
Date: Thu, 20 Apr 2006 07:46:10 +1000
Message-ID: <4446AFA2.2090208@irock.com.au>
Reply-To: vk4akm@wia.org.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Thanks to all those who offered suggestions, It certainly helped me move 
a little up the learning curve.
I decided to try the iptables solution(figuring a knowledge of iptables 
will help in future protection from the nasties on the Inet).

The command
"iptables -A OUTPUT -i sm0 -p udp --dport 137 -j DROP"       failed but
"iptables -A OUTPUT -o sm0 -p udp --dport 137 -j DROP"      worked fine.

However       "iptables -L OUTPUT"     revealed

"target     prot     opt    source        destination"
"DROP       udp      --     anywhere     anywhere         udp 
dpt:netbios-ns"

this appears to not identify the "sm0" destination specified in the 
APPEND command.
I guess I need the netbios for communication with Windoz PC's on my 
network so this does not look like a
fix.
What am I doing wrong?.

-- 
Regards - Ken VK4AKM
          Yeppoon, Queensland
          -= Use Open Source Software =-
                 GNU\Linux Debian.


