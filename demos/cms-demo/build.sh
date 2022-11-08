#!/usr/bin/env bash

nerdctl build --namespace k8s.io --build-arg FPM_LOCATION=127.0.0.1 -t sample-app:kube --target PHP .
nerdctl build --namespace k8s.io --build-arg FPM_LOCATION=127.0.0.1 -t sample-app-webserver:kube --target CADDY .
