# GSP dashboards vs Prometheus/Grafana stack :

## GCP dashboards advantages:
Gsp has some built-in features for monitoring the kubernetes clusters, and so:
- not needed the additional resources;
- not needed to install;
- You can custom tune the appearance of dashboards;
- You don't need the additional ip-adresses & domain names for organize access to them(You can view the dashboards on gsp web interface);

##  Prometheus/Grafana stack advantages:
- easy to install and configure;
- more user-friendly interface;
- more built-in features;
- more flexibility(flexible query language);
- dimensional data model;
- beautiful visualizations;
- interactive graphs;
- easy to create dashboards;
- prometheus provides partitioning and replication;
- prometheus supports a broader set of client libraries;

## GSP disadvantages:
- non stable work and behavior;
- unflexible;
- hasn't such clarity and visibility(like a Prometheus/Grafana stack);

## Prometheus/Grafana stack disadvantages:
- need to install;
- need the additional resources;
