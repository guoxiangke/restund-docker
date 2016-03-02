# Restund Docker
Dockerfile for running restund STUN/TURN server. Comes with STUN authorization patch from http://hancke.name

http://www.creytiv.com/restund.html

# Usage
First, clone this repository

```sh
git clone https://github.com/melonmanchan/restund-docker
```

Then, edit the restund.custom.conf file with the IP address you're going to use, and other such things.
After that, build and start the container. Then, edit restund.env with the credentials of your choice.
Make sure the realm-variable is the same as the one you're using in your restund.custom.conf.


```sh
cd restund-docker
sudo docker build -t restund .
sudo docker run --env-file=restund.env -p 3478:3478 -p 3478:3478/udp restund
```

You can use this site to test your container: https://webrtc.github.io/samples/src/content/peerconnection/trickle-ice/

If there's no connection, changes are you have the wrong IP address in the configuration file. It's not enough
to bind to 127.0.0.1/localhost, but you need to put in the actual address that the container will run under (
the one you get from running docker inspect <CONTAINER_NAME>)

