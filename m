Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26389224EF
	for <linux-hams@vger.kernel.org>; Thu, 30 May 2024 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717089540; cv=none; b=N/gqlJmjv9HpObbs5Nm40X5n97Jg/CiB/MA45iwLt0e34rusAzPlsF8uDKe4ohZRNMcJAY7MBjGKHzjEyOXSSr2j2wr3lgYAe9GVR22cABNB/X3j2E8rrj/nZVbhMUf0dI9/sM4PAhMg95M/zIsrhk5tY4A6dZY2O5l02/baZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717089540; c=relaxed/simple;
	bh=tMlgefaedhbsYZyvuvkvZ7pjy/P0pSu8mLLs27bcWJo=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mYqaClYLLLyUpiEYywlo7LMleZJ3MEtuq1OW9n2zxGE9tDtJ6awjxzMrd11N2bJFU3zctn/x58bBOHcO0hmM/tdn9lXz70TLrC1LR31Y7cMi9VKSiStMyUJpJqJxkDpoYkjTtYtbVrHnSGSQlnnCrMQzjiU0ufqYY/eTA3+tJWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 44UGrhXS005998;
	Thu, 30 May 2024 09:53:43 -0700
Subject: Re: Kernel fails to flush queues when closing sockets
To: Lars Kellogg-Stedman <lars@oddbit.com>,
        linux-hams <linux-hams@vger.kernel.org>
References: <2qncrme5xuch2w2vzznk5eoiebdiiwcwck3dmxet73mzos7zh2@lgdxko4x5bsj>
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <a3f92265-bc95-f23d-e88c-6246d036df07@trinnet.net>
Date: Thu, 30 May 2024 09:53:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2qncrme5xuch2w2vzznk5eoiebdiiwcwck3dmxet73mzos7zh2@lgdxko4x5bsj>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Thu, 30 May 2024 09:53:43 -0700 (PDT)


Hello Lars,


> For testing purposes, I wanted a simple ax25 listener that would accept
> a new connection, send a fixed string, and then disconnect.

I can't comment on the SO_LINGER function but I'm surprised you're 
seeing data loss like that.  Seems like that should be fixed. Anyway, as 
an alternative test, consider setting up ax25d running a bash script 
with echo or even "netcat" commands.

--David
KI6ZHD


