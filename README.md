# Sorcerer v1

## Live demo (last deployed: 2023-02-20)
Click [here](https://sorcerer-v1.fly.dev/) to see Sorcerer in development. Because the application is not ready for production, sign up is not yet available (you will get a validation error because every user must belong to a team). Instead you can log in with the following credentials:
```
email: instructor@northwestern.edu
password: password
```

### Current features
- [x] User authentication
- [x] Real-time messaging via Action Cable (WebSockets) on home page after login. Currently, messages are not persisted to a database. __Note: This feature is not reliable in deployment. After logging messages to the console, it appears that the client-side `message_channel.js` is not connecting as expected. I suspect it might be a problem with redis (specifically Fly.io's Upstash Redis, see [here](https://community.fly.io/t/redis-timeouts/7232)) and how it is configured in production.__

### Planned improvements
- [ ] Add data persistence toggle to real-time messages
- [ ] Live search for sources and quotations
- [ ] Pagination for sources and quotations
- [ ] Refactor inline styles into proper CSS classes.
- [ ] Apply design system to Devise views
- [ ] Implement team and user registration
- [ ] Add navbar brand and favicon
 
## About

The aim of this project is to create an interface for [ChatGPT](https://openai.com/blog/chatgpt/) that allows users to input text sources and prompt a [GPT-3](https://platform.openai.com/docs/models/gpt-3) model to perform [text completions](https://platform.openai.com/docs/guides/completion) with citations. 

Simply put, Sorcerer leverages GPT-3's ability to interpret prompts and analyze text as a means of retrieving information from user-defined sources. Let's put a state-of-the-art language model to the test against the familiar mechanisms of search engines, tags, human curation, and good ol' `Ctrl`+`F`. 

## Finding the right model
[This](https://platform.openai.com/docs/models/finding-the-right-model) discussion in the OpenAI API docs provides a good starting point to consider which text completion model to use. Davinci is the most capable model and supports nearly twice the amount of request tokens (this is its greatest advantage for this application), but Curie offers a similar performance at a significant speed and cost advantage. 

> While Davinci is more capable when it comes to comprehending text and generating responses that are more nuanced like summarizing for a child or emulating human speaking patterns, Curie is highly capable of analyzing text, answering direct questions, and providing key points.

Because the general use case for Sorcerer is more analytical than creative, I have paid close attention to two recommendations put forth by OpenAI:

> 1. Use a low temperature when extracting data

> 2. Use one API call to answer multiple questions

The documentation also offers the[GPT Comparison Tool](https://gpttools.com/comparisontool) to compare various settings (engines, temp, top p, etc.) on a browser. _Note: Your API key is needed to use this tool._

## Outlook
* Because it is possible for a model to insert or change text even when asked for direct quotations, there will have to be a validation mechanism to prevent the user experience from devolving into a [telephone game](https://en.wikipedia.org/wiki/Chinese_whispers) with a neural network. Putting such a check in place will allow me to generate useful data about model configuration and performance.

* There is a limit to how many tokens (4,000 tokens for `text-davinci-003` and 2,048 tokens for `text-curie-001`) can be processed by the availble models. A potential workaround for this would be to train a custom model with user input (see below) or to make multiple API calls behind the scenes. 

* It may be worthwhile to [fine-tune](https://platform.openai.com/docs/guides/fine-tuning) a model for Sorcerer as it may yield higher quality results than "few-shot learning." Custom models would incur higher usage costs as well as the training expenses (which depends on the number of tokens in the training dataset as well as the number of training epochs). How this might be implemented will need to be assessed with regard to the efficacy afforded by the present and future iterations of base models. 