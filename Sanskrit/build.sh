#!/bin/bash

ROOT_DIR=`pwd`
TMP_DIR=build
APP_NAME=sa_spellchecker_OOo3

ROOT_FILES="description.xml dictionaries.xcu LICENSES-hi.txt LICENSES-en.txt sa_IN.dic sa_IN.aff CHANGELOG"
VAR_FILES="description.xml dictionaries.xcu LICENSES-hi.txt LICENSES-en.txt sa_IN.aff"
#uncomment to debug
set -x

. ../tools/version.sh

# remove any left-over files from previous build
rm ../$APP_NAME.oxt
rm ../dict-sa_IN.zip
rm -rf $TMP_DIR

# prepare components and defaults
echo "Copying various files to $TMP_DIR folder..."

mkdir -p $TMP_DIR/META-INF

for ROOT_FILE in $ROOT_FILES ; do
  cp -v $ROOT_FILE $TMP_DIR
done

cp META-INF/manifest.xml $TMP_DIR/META-INF/manifest.xml

cd $TMP_DIR

ls -l

if [ -n "$VAR_FILES" ]; then
  echo "Substituting variables for version $VERSION, commit $BLOB on $REV_DATE..."
  for VAR_FILE in $VAR_FILES; do
  echo $VAR_FILE
      sed -i -e "s/SPELLCHECKERVERSION/$VERSION/" $VAR_FILE
      sed -i -e "s/SPELLCHECKERDATE/$REV_DATE/" $VAR_FILE
  done
fi

# generate the OXT  file
echo "Generating $APP_NAME.oxt..."
zip -r ../../$APP_NAME.oxt *
zip -r ../../dict-sa_IN.zip *

cd "$ROOT_DIR"

# remove the working files
rm -rf $TMP_DIR
echo "Done!"

