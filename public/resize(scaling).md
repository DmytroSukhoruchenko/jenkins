# Important !

When you increase or decrease the size of a node pool that spans multiple zones, the new size represents the number of nodes in the node pool per zone. For example, if you have a node pool size of two that spans two zones, the total node count is four. If you resize the node pool to a size of four nodes, the total node count becomes eight.

Do not use both Cluster Autoscaler and manual resize commands simultaneously on a node pool, as this can cause interactions that result in unstable and/or incorrect node pool size.

## Howto:

### For manual increase/decrease number of nodes You need:

- connection with proper project&cluster
- When you increase the size of a cluster:

    + New node instances are created using the same configuration as the existing instances 
    + New Pods may be scheduled onto the new instances 
    + Existing Pods are not moved onto the new instances 

- When you decrease the size of a cluster:

    + The Pods that are scheduled on the instances being removed are killed 
    + Pods managed by a replication controller are rescheduled by the controller onto the remaining instances 
    + Pods not managed by a replication controller are not restarted 

- gcloud container clusters resize CLUSTER_NAME --node-pool POOL_NAME --num-nodes NUM_NODES

     gcloud container clusters resize method-prod-k8s --node-pool node-pool-main --num-nodes 4

### For manual scale a Deployment feel free to use the following command:

     kubectl scale deployment/nginx-ingress-ingress-nginx-controller --replicas=5

- output is similar to this:

     deployment.apps/nginx-ingress-ingress-nginx-controller scaled 

