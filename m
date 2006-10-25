From: "Lars E. Pettersson" <lars@homer.se>
Subject: Re: Lost password
Date: Wed, 25 Oct 2006 09:13:42 +0200
Message-ID: <453F0EA6.1070002@homer.se>
References: <7.0.1.0.2.20061024213310.047dde60@sasktel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <7.0.1.0.2.20061024213310.047dde60@sasktel.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

On 10/25/2006 05:37 AM, Doug wrote:
> Lost the system password for RH Enterprise 3. User password works
> just fine but I can't change any files. Is there a way to install
> a new password? I have tried Red Hats "single user mode", but it
> went to a kernel panic each time.

Strange that single user mode caused a kernel panic. Do you know why? I 
have never experienced that before (been using RedHat, and later Fedora, 
since 4.something)

I am not fully sure that the RH Enterprise CDs work the same way as the 
Fedora ones, but you could try the following. Start with the RHEL3-CD 
and at the prompt write "linux rescue", you will be asked some questions 
about keyboard, language etc. When it is ready, and you get a normal 
console prompt, you write "chroot /mnt/sysimage" (this is also displayed 
as a help before you are presented with the prompt). You can now simply 
use the passwd-command to change the root-password.

73 de Lars, sm6rpz
-- 
Lars E. Pettersson <lars@homer.se>
http://www.sm6rpz.se/
