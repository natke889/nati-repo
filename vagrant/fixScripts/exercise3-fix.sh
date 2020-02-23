#!/bin/bash
#add fix to exercise3 here
sed -i s/'deny from all'/'allow from all'/ /etc/apache2/sites-enabled/000-default
/etc/init.d/apache2 restart
