From: John Ronan <jronan@tssg.org>
Subject: Re: standard_window_size.
Date: Tue, 9 Dec 2008 08:34:24 +0000
Message-ID: <D4E78BFF-CD8E-4281-B40D-D006E1090768@tssg.org>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com> <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org> <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com> <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com> <50DA4EB2-D38C-4512-B382-F2F5903B3310@gmail.com> <F5C50AA2-F675-4280-B079-0662CAAA8349@tssg.org>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <F5C50AA2-F675-4280-B079-0662CAAA8349@tssg.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Linux-Hams <linux-hams@vger.kernel.org>


Morning,

I tested over the weekend (and I though I had posted it already).

After changing the kernel header to have the standard window size =  
3. This was verified when I booted the machine as the entry in /proc  
was 3.  However, once I connected to it and started passing data, it  
again behaved as though it was set to 2.

RR after every second packet

Suggestions as to where to look next appreciated.

Regards
de John
EI7IG

On 3 Dec 2008, at 22:33, John Ronan wrote:

> Ok,
>
> Now I'm even more baffled, and I think digging in the code is going  
> to have to be the answer here.
>
> Kernel updated to be the same on both (2.6.24.3), my serial ports  
> are working. Now, both ends are behaving the same protocol wise.  
> That is after the data source sends two packets, the sink sends a RR.
>

--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



