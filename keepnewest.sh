#! /bin/sh
# keepnewest
#
# Simple directory trimming tool to handle housekeeping
# Scans a directory and deletes all but the N newest files
#
# Usage: cleanup <dir> <number of files to keep>
#
# v 1.0 Piers Goodhew 1/mar/2007. No rights retained.


if [ $# -ne 2 ]; then
  echo 1>&2 "Usage: $0 <dir> <number of files to keep>"
  exit 1
fi

cd $1
files_in_dir=`ls | wc -l`
files_to_delete=`expr $files_in_dir - $2`
if [ $files_to_delete -gt 0 ]; then
  ls -t | tail -n $files_to_delete | xargs rm
  if [ $? -ne 0 ]; then
    echo "An error ocurred deleting the files"
    exit 1
  else
    echo "$files_to_delete file(s) deleted."
  fi
else
  echo "nothing to delete!"
fi
