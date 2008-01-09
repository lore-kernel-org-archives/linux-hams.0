From: Bill Shell <n6ws@charter.net>
Subject: Re: XMLOG on OpenSuSE v10.3 Problem
Date: Tue, 08 Jan 2008 22:19:22 -0800
Message-ID: <4784676A.2080103@charter.net>
References: <47844CA8.4030803@charter.net> <courier.478462A3.00001C24@radagast.org> <478466FE.9050509@charter.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <478466FE.9050509@charter.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Platt <dplatt@radagast.org>, opensuse-ham@opensuse.org, linux-hams@vger.kernel.org

Bill Shell wrote:
> Thank you for your reply Dave.  I guess I should have included
> additional information on the system configuration.  I typically use
> Gnome desktop, and run XMLog using wine.  I checked on my ubuntu v7.10
> system and I don't see another process begin.  There is a slight
> increase in RAM usage by about 200kb, I did try setting the window
> location on both systems.  The ubuntu system moves the telnet window
> around as I change the left and top variables.  The SuSE system never
> does reappear.  I tried removing and reloading XMLog, but there was no
> change. 
> 73, Bill
>
>
> Dave Platt wrote:
>>> Hello All,
>>>
>>> I am having a problem with XMLog (http://www.xmlog.com) that occurred on
>>> my OpenSuSE v10.3 on a AMD-64x2 4000.  The Telnet window has disappeared
>>> off the screen.  I checked the configuration file and change the top and
>>> left variables for location, but it won't reappear.  Has anyone else run
>>> into this problem? 
>>>     
>>
>> When I've run into this problem with other applications, it has
>> usually been due to window-manager quirks.  Some window managers
>> "memorize" the position of each window (by app or name) and try to
>> "restore" the window position when the app is re-launched.
>>
>> If your window manager has a root-window or other context menu which
>> lists all of the windows know to it, you might be able to re-pick the
>> window from this menu and get it back onto the screen.  If not you may
>> need to locate the window manager's saved configuration data and
>> delete or edit it.
>>
>> Also, check to make sure that you haven't accidentally moved the
>> window to a different pane... e.g. if you're using KDE, check the four
>> (usually) window groups in the Kicker at the bottom and see if the app
>> window you want has migrated to a different pane.
>>
>>
>>   
>

