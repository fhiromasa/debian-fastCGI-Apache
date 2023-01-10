FROM debian:bullseye-slim
WORKDIR /

RUN apt-get update &&\
	apt-get --no-install-recommends -y install \
		# apache, php, vim
		# 必要になったらcpanminusとmakeをインストールする
		apache2 vim unzip cpanminus make \
		# library
		libxml2 libssl-dev libexpat1-dev \
		# perl modules required
		# Perhaps built in perl modules ```CGI, CGI::Cookie, File::Spec, LWP::UserAgent, parent, HTML::Entities, Scalar::Util, DBI
		libimage-size-perl libdbd-mysql-perl \
		# perl moduels option
		perlmagick libxml-sax-expat-perl libimager-perl libyaml-syck-perl libxml-libxml-perl libxml-sax-expatxs-perl libgd-perl libcache-perl \
		# fcgi perl module
		libfcgi-perl \
		# apache module install
		libapache2-mod-php libapache2-mod-fcgid &&\
	apt-get clean &&\
	# perl module Mozilla::CA cannot find in apt
	cpanm --notest Mozilla::CA

# apche settings
COPY ./apache2.conf /etc/apache2/
COPY ./fcgid.conf /etc/apache2/mods-available
RUN a2enmod php7.4 proxy_fcgi fcgid

# apache2 env vars
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]