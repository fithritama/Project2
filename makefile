install:
	install main server /usr/local/bin
	#which dialog >/dev/null 2>&1 || yum -y install dialog /usr/local/bin
	#which xinetd >/dev/null 2>&1 || yum -y install xinetd
	which nc >/dev/null 2>&1 || yum -y install nc
	grep -q "`cat main.services`" /etc/services || cat main.services >> /etc/services
	install main.xinetd /etc/xinetd.d/main
	install main-id.mo /usr/share/locale/id/LC_MESSAGES/main.mo
	/etc/init.d/xinetd restart

main.pot:
	xgettext -o main.pot -a -L Shell main

main-id.mo:
	msgfmt -o main-id.mo main-id.po
