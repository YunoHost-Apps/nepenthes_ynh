This is a tarpit intended to catch web crawlers. 
Specifically, it targets crawlers that scrape data for LLMs - but really, like the plants it is named after, it'll eat just about anything that finds it's way inside.

It works by generating an endless sequences of pages, each of which with dozens of links, that simply go back into a the tarpit. 
Pages are randomly generated, but in a deterministic way, causing them to appear to be flat files that never change. 
Intentional delay is added to prevent crawlers from bogging down your server, in addition to wasting their time. 
Lastly, Markov-babble is added to the pages, to give the crawlers something to scrape up and train their LLMs on, hopefully accelerating model collapse.

[You can take a look at what this looks like, here. (Note: VERY slow page loads!)](https://zadzmo.org/nepenthes-demo)

## How to use?

1. Add link on one of your websites to selected url (by default: your_domain/maze). 
2. Add selected url to ``robots.txt``, so only services not respecting it will be targeted. 

```bash
# first disallow access to your website to all known AI robots
curl https://raw.githubusercontent.com/ai-robots-txt/ai.robots.txt/refs/heads/main/robots.txt > website_root/robots.txt
# and disallow all agents to access /maze
echo -e "\nUser-agent: *\nDisallow: /maze\n" >> website_root/robots.txt
```

## See statistics

You can monitor nephenthes statistics using

```bash
curl http://localhost:8893/stats | jq
curl http://localhost:8893/stats/agents | jq
curl http://localhost:8893/stats/addresses | jq
```

More information at https://zadzmo.org/code/nepenthes/

