## SSH Client certificate verification demo

Sole purpose of this repository is to demonstrate minimum setup for verification
of client ssh certificate when authenticating against ssh daemon (SSHD).
3 docker images will be built
 - Common volume with all keys (CA private/public key), and client key
 - SSH server image
 - SSH client image

Once containers are started, client will do the following
 - sign it's key using CA private key with validity period of 60 seconds
 - login to ssh server and write server hostname (container id) and time on
   standard output as long
 - repeat step above every 5 seconds as long as certificate is valid.
 - client container will stop once

All images are based on `debian:jessie` image

## Requirements

- Docker compose supporting compose file version >=3
- Docker daemon

## Usage

```
$ git clone https://github.com/toshke/sshd-certificate-authorization-demo
$ cd sshd-certificate-authorization-demo
$ docker-compose up
```

## Contributing

Couple of ideas for improving this demo
 - demonstrate host key validation on client side
 - demonstrate using authorized_keys file

Pull requests are welcome :)

## History

- (2017-09-12) Initial version demonstrating SSHD server verifying wether client
  key is signed with Certificate Authority (CA)

## License

The MIT License (MIT)

Copyright (c) 2017 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
