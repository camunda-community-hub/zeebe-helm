#! /bin/bash
base_url="http://chartmuseum.jx.35.233.51.246.nip.io"
charts='["zeebe-cluster", "zeebe-operate", "zeebe-full", "zeebe-operator",  "zeeqs", "zeebe-cloud-events-router", "tickets-service", "payments-service"]'

echo $charts | jq ".[]" | xargs -I ^ curl -s "$base_url/api/charts/^/" | jq '.urls[0]' | xargs -I ^ curl -Os "$base_url/^"

helm repo index --url http://helm.zeebe.io .
