backuptools
===========

mysqlbackup
-----------

Backup every table in every database into individual compressed files.

Install `wget https://raw.githubusercontent.com/Uskur/backuptools/master/mybackup.bash; chmod 755 mybackup.bash`

Edit `nano mybackup.bash`

Run `./mybackup.bash`

A MySQL user like so is ideal:

```
GRANT SELECT, RELOAD, FILE, SHOW DATABASES, SUPER, LOCK TABLES, SHOW VIEW ON *.* TO '[YOURUSER]'@'localhost' IDENTIFIED BY '[YOURPASS]';
```

duplicitybackup
---------------
Backup to Google Cloud Storage

based on http://www.willdurness.com/back-up-your-vm-to-google-cloud-storage-using-duplicity/

```
apt-get update
apt-get install gcc python-dev python-setuptools python-software-properties python-boto duplicity
wget http://storage.googleapis.com/pub/gsutil.tar.gz
tar xvfz gsutil.tar.gz -C /usr/local/bin
echo export PATH=/usr/local/bin/gsutil:$PATH >> ~/.bashrc
source ~/.bashrc
gsutil config -a
wget https://raw.githubusercontent.com/Uskur/backuptools/master/duplicitybackup.bash
chmod 755 duplicitybackup.bash
nano duplicitybackup.bash
```

to restore:

```
duplicity restore --time "[YYYY-MM-DD]T[HH:MM:SS]" gs://[BUCKET]/[PATH] --file-to-restore [SOURCE] ./[TARGET]
```
