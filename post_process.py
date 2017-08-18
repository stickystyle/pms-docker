#!/bin/env python

import sys
import os
import logging

from rq import Queue
from redis import StrictRedis

logging.basicConfig(level=os.getenv("LOGLEVEL", "INFO"))

log = logging.getLogger(__name__)

RQ_TIMEOUT = os.getenv("RQ_TIMEOUT", "6h")
RQ_REDIS_URL = os.getenv("RQ_REDIS_URL", "redis://localhost:6379")

try:
    log.info("Enqueuing %s", sys.argv[1])
    r = StrictRedis().from_url(url=RQ_REDIS_URL)
    q = Queue(connection=redis_conn)
    q.enqueue("postprocess.post_process", sys.argv[1], timeout=RQ_TIMEOUT)
except:
   log.exception("Failed to enqueue %s", sys.argv[1]) 
