## Large Scale Graph Mining with Spark: What I learned from mapping >15 million sites

(PyGotham 2018 talk)

As the web grows ever larger and more content-rich, graph analysis may be one of the most powerful tools for unlocking insights within the mythical big data. That’s totally not fluff, because WIRED wrote about it (https://www.wired.com/insights/2014/03/graph-theory-key-understanding-big-data/).

This talk relates to ongoing research into large-scale graph mining, and to find insights into how different websites interact with each other (sometimes in surprising ways!). Spark GraphFrames was integral to exploring the enormous Common Crawl dataset, and the data size really pushed the tool to its limits. Along the way, I learned a great deal about optimizations in representing and computing graphs.

We’ll talk about:

* Why graphs are so fascinating and the types of problems they can help solve
* How Spark GraphFrames work under the hood.
* How to find clusters of interest in your graph.
* Tips that may help you in your journey (hint: you’re only as good as your data structure).

And much more! 

For more details, see my Medium post.

### Getting started with the notebooks

This repo includes Dockerfile for running a Jupyter notebook with pyspark. 

___Running the notebook___

1. Make sure you have [Docker](https://www.docker.com/) installed.
2. Run `make build` to create your Docker image. This may take a while.
3. Run `make run_notebook_volume`. This starts a Docker container with a volume containing the notebooks and sample dataset
4. Go to `127.0.0.0:8888` to see the notebook server. You may need to enter authentication token, which will be somewhere in your terminal output.
5. Open `work/notebooks/Graphframes_demo`.

___About the sample dataset___

I also included a small sample dataset that I created from the Common Crawl September 2017 dataset. The data, stored in a parquet file under `notebooks/data/outlinks_pq`, has the following format:
 * `parent`: full URL of parent node, the html I pulled links from.
 * `parentTLD`: top level domain of parent
 * `childTLD`: top level domain of child
 * `child`: full url of child node, the link found on the `parent` web page.
 
 Hopefully this will jumpstart your exploration of web graphs, LPA, PageRank, and other cool features!

### References

Atkins, Karla, et al. "The structure of electrical networks: a graph theory based analysis." _International Journal of Critical Infrastructures_ 5.3 (2009): 265-284.

Bryan, Kurt, and Tanya Leise. "The $25,000,000,000 eigenvector: The linear algebra behind Google." _SIAM review_ 48.3 (2006): 569-581.

Common Crawl dataset (September 2017).

Farine, Damien R., et al. "Both nearest neighbours and long-term affiliates predict individual locations during collective movement in wild baboons." _Scientific reports_ 6 (2016): 27704

Garimella, Kiran, et al. "Polarization on Social Media" KDD’18. London. 20 August 2018. Lecture.

Leskovec, Jure, Anand Rajaraman, and Jeffrey David Ullman. _Mining of massive datasets_. Cambridge University Press, 2014.

Mottin, Davide and and Emmanuel Müller. "Graph Exploration: Let me Show what is Relevant in your Graph" KDD’18. London. 19 August 2018. Lecture.

Page, Lawrence, et al. "The pagerank citation ranking: Bringing order to the web." (1998): 68.

Raghavan, Usha Nandini, Réka Albert, and Soundar Kumara. "Near linear time algorithm to detect community structures in large-scale networks." _Physical review_ E 76.3 (2007): 036106.

Zachary karate club network dataset -- KONECT, April 2017.

### Additional Resources

___Spark___

* I like _Learning Spark_ by Holden Karau, Andy Konwinski, Patrick Wendell, and Matei Zaharia. 
* Also _High Performance Spark_ by Holden Karau and Rachel Warren.

___GraphFrames___

* [Spark GraphFrames](https://graphframes.github.io/quick-start.html) documentation. 
* Databricks [blog post](https://databricks.com/blog/2016/03/03/introducing-graphframes.html) about GraphFrames.
