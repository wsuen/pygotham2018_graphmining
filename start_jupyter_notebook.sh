#!/usr/bin/env bash

export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_SUBMIT_ARGS="--packages graphframes:graphframes:0.6.0-spark2.3-s_2.11"

echo $PYSPARK_SUBMIT_ARGS

jupyter notebook --ip '*' \
                 --port 8888 \
                 --no-browser \
                 --allow-root


import os
os.environ['PYSPARK_SUBMIT_ARGS'] = '--packages graphframes:graphframes:0.6.0-spark2.3-s_2.11 pyspark-shell'

import pyspark
sc = pyspark.SparkContext("local[*]")
