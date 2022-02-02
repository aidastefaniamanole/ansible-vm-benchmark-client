#!/bin/bash

SCALE=$1
DAYS=$2

(cd data-generation-tool/cmd/tsbs_generate_data/; SCALE=$SCALE ./run_data_generator.sh days $DAYS)
(cd data-generation-tool/cmd/tsbs_generate_queries/; QUERY=single-groupby-all-all-5m SCALE=$SCALE QUERIES=576 ./run_query_generator.sh)
(cd data-generation-tool/cmd/tsbs_generate_queries/; QUERY=double-groupby-all SCALE=$SCALE QUERIES=2 ./run_query_generator.sh)
java -Xmx2g -jar benchmark-client-tool -queryMixer -insertFile ${SCALE}hosts \
    -queryFile5m single-groupby-all-all-5m.csv \
    -queryFile24h double-groupby-all.csv
