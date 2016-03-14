Dockered Firefox
================

This image provides a default firefox that can be used for checking the compatibility of websites. The specialty of this image is that it allows you to customize /etc/hosts file so that you can test a domain name without setting up a temporary DNS or DNS proxy.


How to use
----------

``` bash
docker run  -v $HOME/Downloads:/home/firefox/Downloads:rw \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v /dev/snd:/dev/snd \
            -e UID=$(id -u) \
            -e GID=$(id -g) \
            -e DISPLAY=unix$DISPLAY \
            -e URL=http://www.docker.com \
            -e "EXTRA_HOSTS=$1" \
            --name firefox \
            --rm \
            spacelis/firefox bash
```

You may alternatively insert a file into ```/etc/hosts``` by using ```-v /path/to/your/hosts:/etc/extra_hosts```

LICENSE
------
The MIT License (MIT)
Copyright (c) 2016 Wen Li

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
