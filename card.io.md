Hi Gustavo,

I just saw your discussion on the tensorflow mailing list.

If you'd like another proprietary project that went open source and
left behind it's history, card.io did that. I was pretty involved in
that, so I will answer the same questions in the hopes that it helps
you.


> 1. Why did you decide to not keep the software history?

The very early history included lots of floundering that would very
likely be distracting or confusing to look at now.

It also made it much easier to get the lawyers at our parent company
to agree to open source it--instead of having to review the entire
history for safety, they could review just the current state. The
whole things was safe (IMHO), but it was hard enough to get them to
agree to open source it at all, so I made every concession I could.

Also, we made a significant number of changes in order to open source
it, like removing special extensions for special customers,
eliminating dead code, and removing instrumentation and analytics that
didn't make sense in the context of open source. The amount of
reorganization that happened *just before* open sourcing meant that it
would be harder to track the history than to just understand the
current state.

Lastly, two of the primary motivations (in my experience) for keeping
history are egos and understanding bug fixes. card.io was low on ego,
and we were careful to comment non-trivial or subtle bug fixes, so
those two historical artifacts weighed less heavily.


> 2. Do the _core developers_ faced any kind of problems, when trying to refer
> to the old history? If so, how did they solve these problems?

As far as I know, none of the core developers has wanted or needed to
go look back through the history.


> 3. Do the _newcomers_ faced any kind of problems, when trying to refer to
> the old history? If so, how did they solve these problems?

card.io is generally hard to get up to speed on, in no small part
because a segment of the code is a "black box"--generated code, but
without the script used to generate it. There are silly, historical
reasons for this. It is unfortunate, but hard to fix at this point. If
we were going to put a big effort into welcoming newcomer
contributions, it would be far more valuable to document how things
currently work than give access to the history of the project.


> 4. How does the lack of history impacted on software evolution? Does it
> placed any burden in understanding and evolving the software?

Given all of the above, I don't think it has had a big impact;
certainly not enough to outweigh the costs of making it public.



I'd be curious to receive a copy of your work when it is completed; if
you have a list, please add me to it. :)


Regards,
Josh
