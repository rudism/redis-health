redis-health
============

`GET /health` will return 200 if the node is master, 409 if the node is slave, or 500 if a connection to Redis could not be established. Can be used as a health check from (for example) Route53 to make sure your domain always points to the master node when you have a Redis cluster being controlled by Sentinel.
