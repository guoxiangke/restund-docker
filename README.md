# Restund Docker
Dockerfile for running restund STUN/TURN server.

http://www.creytiv.com/restund.htmlhttp://www.creytiv.com/restund.html

# Usage
First, clone this repository

```sh
git clone https://github.com/melonmanchan/restund-docker
```

Then, edit the restund.custom.conf file with the IP address you're going to use, and other such things.
After that, build and start the container.

```sh
cd restund-docker
sudo docker build -t restund .
sudo docker run restund
```

