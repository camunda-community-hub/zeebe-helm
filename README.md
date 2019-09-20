# Zeebe Kubernetes HELM Charts

Currently hosting the following charts: 
- zeebe-cluster-k8s-helm
  - Depends on: elasticsearch, kibana
- zeebe-operate-k8s-helm
  - Can be configured to point to zeebe-cluster-helm
- zeebe-full-k8s-helm
  - Depends on: zeebe-cluster-k8s-helm and zeebe-operate-k8s-helm
  
Feel free to create new issues if you find problems with the charts. 
