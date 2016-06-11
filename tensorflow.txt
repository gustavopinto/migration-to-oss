Gustavo,

That's a nice project. Here are answers for TensorFlow:

1. Why did you decide to not keep the software history?

Before moving to GitHub, TensorFlow was developed on a system other than Git, and transferring history was not straightforward and it's value was at best unclear, so we didn't do it.

2. Do the _core developers_ faced any kind of problems, when trying to refer to the old history? If so, how did they solve these problems?

No, we still use the non-git system internally and can refer to history if we need to.

3. Do the _newcomers_ faced any kind of problems, when trying to refer to the old history? If so, how did they solve these problems?

I am not aware of problems that developers developing exclusively on GitHub have faced because of the lack of historical information dating back further than November. git blame can be wrong, but since only core developers with access to the history triage bugs, this has not been a problem (and blame information is getting better over time).

4. How does the lack of history impacted on software evolution? Does it placed any burden in understanding and evolving the software?

History is not lacking, it is just lacking in git. In general though the utility of history has a halflife, which corresponds closely to the stability of the software concerned. For a fast-moving project like TensorFlow, history from more than half a year ago is not particularly valuable for development (although certainly interesting for research).


Hope that helps,
Martin
