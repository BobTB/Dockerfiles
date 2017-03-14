#!/bin/sh
echo ${GID}
addgroup -g ${GID} z2pdf && adduser -h /home/onyx -s /bin/sh -G onyx -u ${UID} -D z2pdf
chown -R $UID:$GID /opt/z-to-pdf

if [ $# -eq 0 ]; then
	exec su-exec z2pdf:z2pdf z2pdf:z2pdf java -jar /opt/z-to-pdf/zmarkdown2pdf-0.0.1-SNAPSHOT-fat.jar -conf /opt/z-to-pdf/conf.json
else
	exec su-exec z2pdf:z2pdf $@
fi

#su z2pdf && 
#exec z2pdf:z2pdf java -jar /opt/z-to-pdf/zmarkdown2pdf-0.0.1-SNAPSHOT-fat.jar -conf /opt/z-to-pdf/conf.json 
#sudo service nginx restart
#runuser -l z2pdf -c "java -jar /opt/z-to-pdf/zmarkdown2pdf-0.0.1-SNAPSHOT-fat.jar -conf /opt/z-to-pdf/conf.json"
