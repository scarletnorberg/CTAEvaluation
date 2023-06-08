#! /usr/bin/env bash

#docker run -it -p 24224:24224 -v /path/to/conf/test.conf:/fluentd/etc/test.conf -e FLUENTD_CONF=test.conf fluent/fluentd:latest
#docker network create --subnet=172.18.0.0/16 mynet123
#localhost/ctafluent/ctafluent                   latest
#docker run --ip 10.88.0.3 -v /root/cta_keytabs/:/keytabs -v /root/CTAEvaluation/docker_fluent/fluent.conf:/fluentd/etc/fluent.conf -e FLUENTD_CONF=fluent.conf -it ctafluent/ctafluent:latest bash & #sudo LD_PRELOAD=/opt/td-agent/embedded/lib/libjemalloc.so /usr/sbin/td-agent -c /etc/td-agent/td-agent.conf --user td-agent --group td-agent &
docker run --ip 10.88.0.3 -v /root/cta_keytabs/:/keytabs -it ctafluent/ctafluent:latest bash &
#docker run --ip 10.88.0.3 -v /root/cta_keytabs/:/keytabs -v /root/CTAEvaluation/docker_fluent/fluent.conf:/fluentd/etc/fluent.conf -e FLUENTD_CONF=fluent.conf -it ericvaandering/cms_testing:latest && -it fluent/fluentd:latest bash
