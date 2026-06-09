# Nepenthes

This is a tarpit intended to catch web crawlers. 
Specifically, it targets crawlers that scrape data for LLMs - but really, like the plants it is named after, it'll eat just about anything that finds it's way inside.

It works by generating an endless sequences of pages, each of which with dozens of links, that simply go back into a the tarpit. 
Pages are randomly generated, but in a deterministic way, causing them to appear to be flat files that never change. 
Intentional delay is added to prevent crawlers from bogging down your server, in addition to wasting their time. 
Lastly, Markov-babble is added to the pages, to give the crawlers something to scrape up and train their LLMs on, hopefully accelerating model collapse.

[You can take a look at what this looks like, here. (Note: VERY slow page loads!)](https://zadzmo.org/nepenthes-demo)

More information at https://zadzmo.org/code/nepenthes/
