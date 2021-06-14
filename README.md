### This repo is not actively monitored, please don't open any issues


The goal is to deploy Guestbook application on a GKE cluster with Istio enabled. This repo has the IAC code to spin up a cluster, install istio and deploy Guestbook application.

guestbook.sh is  shell script which has all the necessary steps included to everything for you. 

Clone this repository, and run ``` ./guestbook ``` from the root directory - It will create a cluster, install Istio and deploy Guestbook

In order to see the frontend of the application - ``` kubectl get svc -n istio-system ```. Get the Ingress ip address and access it via any browser.



