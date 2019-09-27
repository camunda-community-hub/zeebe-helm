# Zeebe Kubernetes HELM Charts

Currently hosting the following charts: 
- zeebe-cluster
  - Depends on: elasticsearch, kibana
- zeebe-operate
  - Can be configured to point to zeebe-cluster
- zeebe-full
  - Depends on: zeebe-cluster and zeebe-operate
  
Feel free to create new issues if you find problems with the charts. 
