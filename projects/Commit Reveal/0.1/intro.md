# Commit Reveal


The commit-reveal is one of the very foundations of the ways in which we securely interact with other entities on the blockchain. Austin Griffith in his videos on the topic called commit-reveal “an oldie but a goodie” :)


### What is commit-reveal ?
As it evident from the name itself, commit-reveal is made up of two parts:

> 1. **Commit**: You assert your choice to your peers. 

> 2. **Reveal**: You reveal your choice, and everyone can verify that is in fact what you committed to.

To put it more simply, commit-reveal allows you to tell the blockchain some information without the need to reveal exactly what that is initially. Later when you reveal your answer, others can verify that what you committed earlier is the same information that you just revealed. 

Are you curious about how do we do this? We use a technique called **hashing**. We will discuss hashing in more detail manner in the tutorials ahead.

### How about an example involving some magic ✨?

An example of commit-reveal could be the sealed envelope trick performed by many Magicians. There are many versions of this magic trick but the version I’m talking about here is the one where a magician presents a sealed envelope where he has already written the answer to the card you are going to pick ( or the sum of the numbers that you will choose). So he has already **committed** the answer. 

Next the trick is performed where you pick a seemingly random card from a deck (or write out a few random numbers) and then he **reveals** the answer in his envelope, viola its correct.  The audience is amazed and you are left wondering how ? 

Did you see the commit-reveal here? He **commits** and seals his answer first so he can not change it later when it is **revealed**.

[Image of the magician's revealed envelope (to be replaced)](https://s29877.pcdn.co/wp-content/uploads/2019/02/celebrity-in-envelope-trick-revealed.jpg)

Sadly, we will not be doing any magic in this tutorial but we will be learning about commit-reveal while we build a simple game. While we’ll be using the **Ethereum** Blockchain for this tutorial, the idea of commit reveal should be applicable to most other Blockchains. 

### What are we going to build ?

I’m glad you’re excited because we are going to build    Drumroll 🥁      *Rock Paper Scissors*. We will start by getting a simple version of Rock paper scissors running. Then we will figure out what are the flaws and problems with our existing Dapp. We will see how someone can cheat if they wanted to. We will then learn more about commit reveal. Finally, we will add commit reveal to our awesome dapp to solve the problem and make it even more awesome.

### References

1. Austin’s video on commit reveal

2. [Definition of commit reveal](https://karl.tech/learning-solidity-part-2-voting/)