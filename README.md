Dockered Browser
================

This image provides Firefox (v57) and Chromium (v62) that can be used for checking the compatibility of websites.
The specialty of this image is that it allows you to customize /etc/hosts file so that you can test a domain name without setting up a temporary DNS or DNS proxy.
It also allows you to adding a mock CA certificate to the browser to mimic valid HTTPs connection.


How to use
----------

The following command will start a browser in a containered browser displayed on your host X11.
The domain name `www.example.org` will be redirected to the IP address.
Your mock CA certificates will be add to the browser so that it will not complain unsafe certificates.

``` bash
dchrome.sh www.example.org:172.17.0.2 example_ca.crt
```

``` bash
dfirefox.sh www.example.org:172.17.0.2 example_ca.crt
```

**NOTE** If you have problem starting the browser, make sure your have the permission of connecting to the host X11.
A possible solution would be `xhost + local:docker`.
Please refer to the doc of `xhost` for more details.

**NOTE** Single self-signed certificates may not work. 
Try creating a CA certificates (self-signed); use it to sign your web certificate; and use the CA certificate in the command.

LICENSE
------
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
