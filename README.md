# Zeebe Kubernetes HELM Charts
Feel free to file issues if you find problems with the charts. 

Currently hosting the following charts: 
- zeebe-cluster-k8s-helm
  - Depends on: elasticsearch, kibana
- zeebe-operates-k8s-helm
  - Can be configured to point to zeebe-cluster-helm
- zeebe-full-k8s-helm
  - Depends on: zeebe-cluster-k8s-helm and zeebe-operates-k8s-helm
