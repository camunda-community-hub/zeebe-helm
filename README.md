# Zeebe Kubernetes HELM Charts

![Zeebe Kubernetes HELM Charts](imgs/zeebe-k8s-helm.png)

This repository host Zeebe HELM charts for Kubernetes, this charts can be accessed by adding the following HELM repo to your HELM setup:
```
> helm repo add zeebe https://helm.zeebe.io
> helm repo update
``` 
There are three main charts which are represented in the following image:
![HELM CHARTS](imgs/charts.png)

You can consume each individual chart, or use the `zeebe-full` chart which will install all the components, including an NGINX Ingress Controller.

Currently hosting the following charts: 
- [zeebe-cluster](http://github.com/zeebe-io/zeebe-cluster-helm)
  - Depends on: [ElasticSearch](https://github.com/elastic/helm-charts/tree/master/elasticsearch), [Kibana](https://github.com/elastic/helm-charts/tree/master/kibana)
- [zeebe-operate](http://github.com/zeebe-io/zeebe-operate-helm)
  - Can be configured to point to zeebe-cluster
- [zeebe-full](http://github.com/zeebe-io/zeebe-full-helm)
  - Depends on: zeebe-cluster, zeebe-operate and [nginx-ingress](https://github.com/helm/charts/tree/master/stable/nginx-ingress)
  
Follow [the instructions in the Zeebe docs](https://docs.zeebe.io/kubernetes/installing-helm.html) to install Zeebe to a K8s cluster using these charts.

Please create [new issues](https://github.com/zeebe-io/zeebe-helm/issues) if you find problems with these charts. This repository is hosted using GitHub Pages and the source code repository can be found here: [https://github.com/zeebe-io/zeebe-helm/](https://github.com/zeebe-io/zeebe-helm/)

This charts are being released internally at: http://chartmuseum.jx.35.233.51.246.nip.io/charts/ where you can find the latest builds, which are periodically updated in this repository. 

