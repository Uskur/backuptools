#!/bin/bash
PathToBackup=$2
BucketName=$1
Action=$3
buckets="`/usr/local/bin/gsutil/gsutil ls gs://`"
if [[ $buckets =~ .*$BucketName.* ]]
then
        echo "Bucket exists"
else
        /usr/local/bin/gsutil/gsutil mb -c nearline -l eu gs://$BucketName
fi

export PASSPHRASE=[YOURPASSPHRASE]
if [[ $Action == "status" ]]
then
        duplicity --archive-dir /root/.cache/duplicity/ collection-status gs://$BucketName$PathToBackup
elif [[ $Action == "du" ]]
then
        /usr/local/bin/gsutil/gsutil du -ch gs://$BucketName$PathToBackup
elif [[ $Action == "files" ]]
then
        duplicity --archive-dir /root/.cache/duplicity/ list-current-files gs://$BucketName$PathToBackup
elif [[ $Action == "clean" ]]
then
        duplicity --archive-dir /root/.cache/duplicity/ --force remove-older-than 3M gs://$BucketName$PathToBackup
        duplicity --archive-dir /root/.cache/duplicity/ --force cleanup gs://$BucketName$PathToBackup
else
        duplicity --archive-dir /root/.cache/duplicity/ --force remove-older-than 3M gs://$BucketName$PathToBackup
        duplicity --archive-dir /root/.cache/duplicity/ --full-if-older-than 1M $PathToBackup gs://$BucketName$PathToBackup
fi
unset PASSPHRASE
