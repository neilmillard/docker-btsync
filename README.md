Docker-btsync
-------------
A btsync container, 
debian contains the dockerfile to run btsync (2.3.8) based on a debian base.
apache label expands on this with the default apache location to be used with
images derived from that in the standard docker library

example usage
-------------

```
docker run --name datastore -d neilmillard/btsync:apache SOMEBTSYNCSECRET
docker run --name some-wordpress --link some-mysql:mysql -p 8080:80 \
           -e WORDPRESS_DB_PASSWORD=example --volumes-from datastore \
           -d wordpress:php7.0
```
The wordpress container relies on either a mysql container or mysql settings.