# js-tbd

TIBCO Data Virtualization Business Directory in Docker

This is a very simple Docker build file that will allow you to create a usable Docker image.
It is currently configured for TDV 8.1.0, so please download TDV BD .bin installer and put it
in the resources subfolder. Then do

\$ docker build -t js-tbd .

and you're good to go:

\$ docker run -p 9500-9509:9500-9509 --name js-tbd js-tbd
