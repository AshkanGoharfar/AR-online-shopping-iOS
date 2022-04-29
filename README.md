## Readme

# Table of contents
- [App Demo](#App Demo)
- [Running](#How to Run)
- [Context](#Context)
- [Content](#Content)
- [How it's written](#How-it's-written)
- [Acknowledgements](#Acknowledgements)
- [Citation Request](#Citation-Request)
- [Inspiration](#Inspiration)


# App Demo

https://user-images.githubusercontent.com/25262431/166058501-12bc6d2a-96c2-4dc7-bf2d-f1fe7932abb0.mp4


# How to Run
To Crawl alexa.com:

Write input and output file name and then write number of generation that you need

To Crawl coinmarketcap.com airdrops:
Run the following command.
```bash
$ python Collect_dataset.py
```
# Context
Alexa Internet ranks websites primarily on tracking a sample set of Internet traffic—users of its toolbar for the Internet Explorer, Firefox and Google Chrome web browsers. The Alexa Toolbar includes a popup blocker (which stops unwanted ads), a search box, links to Amazon.com and the Alexa homepage, and the Alexa ranking of the website that the user is visiting. It also allows the user to rate the website and view links to external, relevant websites. Also, Alexa has prepared a list of information for each site for comparison and ranking with other similar sites for each site.

This dataset is a record of all information on the top websites in each category in Alexa ranking.

# Content
The dataset includes several site data, which were achieved from "alexa.com/siteinfo" (for example alexa.com/siteinfo/facebook.com). Data is included for the top 50 websites for every 550 categories in Alexa ranking. (The dataset was obtained for about 12200 sites.)
The data also includes keyword opportunities breakdown fields, which vary between categories. As well as each site has important parameters like alltopicstopkeywordssearchtrafficparameter which represent search traffics in competitor websites to this site.
For more details about each site's data, you can find the site's name and site's information in the dataset and you can search alexa.com/siteinfo/SiteName link to understand each parameter and columns in the dataset.


# How it's written
The dataset was collected using the Beautiful soup and selenium library with chrome web driver in order to crawl alexa.com data using python language.



# Acknowledgements

Provider:
Ashkan Goharfar, ashkan_goharfar@aut.ac.ir,
Department of Computer Engineering and Information Technology,
Amirkabir University of Technology

Dataset Source: https://www.kaggle.com/ashkangoharfar/sites-information-data-from-alexacom-dataset

# Citation Request
A. Risheh, A. Goharfar, and N. T. Javan, "Clustering Alexa Internet Data using Auto Encoder Network and Affinity Propagation," 2020 10th International Conference on Computer and Knowledge Engineering (ICCKE), Mashhad, Iran, 2020, pp. 437-443, doi: 10.1109/ICCKE50421.2020.9303705.
Ashkan Goharfar


# Inspiration

Possible uses for this dataset could include:

Sentiment analysis in a variety of forms.
Classifying websites based on their competitor websites, daily time visit of the website and Keyword opportunities.

Analyzing what factors affect on Comparison metrics search traffic, Comparison metrics data, Audience overlap sites overlap scores, top keywords share of voice, top keywords search traffic, optimization opportunities organic share of voice, Optimization opportunities search popularity, Buyer keywords organic competition, Buyer keywords Avg traffic, Easy to rank keywords search pop, Easy to rank keywords relevance to site, Keyword gaps search popularity, Keyword gaps Avg traffic and Keywords search traffic.

Training ML algorithms like RNNs to generate a probability for each site in each category to being SEO by Google.

Use NLP for columns like keyword gaps name, Easy to rank keywords name, Buyer keywords name, optimization opportunities name, Top keywords name ,and Audience overlap similar sites to this site.
