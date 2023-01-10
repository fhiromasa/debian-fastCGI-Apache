# This is FastCGI MovableType Docker Environment

## setting for build

1. copy `.env.example` to `.env`
1. put MT zip file `cgi-bin` and extract zip file
1. rename `cgi-bin/MT*` to `cgi-bin/mt`
1. copy `docker/web/mt-config.cgi` to `cgi-bin/mt/mt-config.cgi`
