## Large Scale Graph Mining with Spark: What I learned from mapping >15 million sites

PyGotham 2018 talk.

For more details, see my Medium post.

### Getting started

This repo includes Dockerfile for running a Jupyter notebook with pyspark. 

___Running the notebook___

1. Make sure you have [Docker](https://www.docker.com/) installed.
2. Run `make build` to create your Docker image. This may take a while.
3. Run `make run_notebook_volume`. This starts a Docker container with a volume containing the notebooks and sample dataset
4. Go to `127.0.0.0:8888` to see the notebook server. You may need to enter authentication token, which will be somewhere in your terminal output.
5. Open `work/notebooks/Graphframes_demo`. 

___Stopping Jupyter notebook___

1. Find Docker process with `docker ps`.
2. Kill container with `docker kill <container_id>`.

___About the sample dataset___

I also included a small sample dataset that I created from the Common Crawl September 2017 dataset. The data, stored in a parquet file under `notebooks/data/outlinks_pq`, has the following format:
 * `parent`: full URL of parent node, the html I pulled links from.
 * `parentTLD`: top level domain of parent
 * `childTLD`: top level domain of child
 * `child`: full url of child node, the link found on the `parent` web page.
 
 Hopefully this will jumpstart your exploration of web graphs, LPA, PageRank, and other cool features!

### References

Common Crawl dataset (September 2017).

Farine, Damien R., et al. "Both nearest neighbours and long-term affiliates predict individual locations during collective movement in wild baboons." _Scientific reports_ 6 (2016): 27704

Fortunato, Santo. "Community detection in graphs." Physics reports 486.3-5 (2010): 75-174.

Garimella, Kiran, et al. "Polarization on Social Media" KDD’18. London. 20 August 2018. Lecture.

Leskovec, Jure, Anand Rajaraman, and Jeffrey David Ullman. _Mining of massive datasets_. Cambridge University Press, 2014.

Raghavan, Usha Nandini, Réka Albert, and Soundar Kumara. "Near linear time algorithm to detect community structures in large-scale networks." _Physical review_ E 76.3 (2007): 036106.

Zachary karate club network dataset -- KONECT, April 2017.

### Additional Resources

___Spark___

* I like _Learning Spark_ by Holden Karau, Andy Konwinski, Patrick Wendell, and Matei Zaharia. 
* Also _High Performance Spark_ by Holden Karau and Rachel Warren.

___GraphFrames___

* [Spark GraphFrames](https://graphframes.github.io/quick-start.html) documentation. 
* Databricks [blog post](https://databricks.com/blog/2016/03/03/introducing-graphframes.html) about GraphFrames.
