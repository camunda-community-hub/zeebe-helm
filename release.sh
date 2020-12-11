#! /bin/bash
base_url="http://chartmuseum-jx.35.222.17.41.nip.io"
charts='["zeebe-cluster-helm", "zeebe-operate-helm", "zeebe-full-helm", "zeebe-operator",  "zeebe-zeeqs-helm","zeebe-tasklist-helm", "zeebe-cloud-events-router", "tickets-service", "payments-service"]'

echo $charts | jq ".[]" | xargs -I ^ curl -s "$base_url/api/charts/^/" | jq '.urls[0]' | xargs -I ^ curl -Os "$base_url/^"

helm repo index --url http://helm.zeebe.io .
