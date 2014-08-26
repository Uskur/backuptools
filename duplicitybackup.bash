#!/bin/bash
PathToBackup=$2
BucketName=$1
Action=$3
buckets="`/usr/local/bin/gsutil/gsutil ls gs://`"
if [[ $buckets =~ .*$BucketName.* ]]
then
        echo "Bucket exists"
else
        /usr/local/bin/gsutil/gsutil mb -c DRA -l EU gs://$BucketName
fi

export PASSPHRASE=[YOURPASSPHRASE]
if [[ $Action == "status" ]]
then
        duplicity collection-status gs://$BucketName$PathToBackup
else
        duplicity remove-older-than 3M gs://$BucketName$PathToBackup
        duplicity --full-if-older-than 1M $PathToBackup gs://$BucketName$PathToBackup
fi
unset PASSPHRASE
