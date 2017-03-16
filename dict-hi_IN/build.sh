#!/bin/bash

ROOT_DIR=`pwd`
TMP_DIR=build
APP_NAME=hi_spellchecker_OOo3

ROOT_FILES="description.xml dictionaries.xcu LICENSES-hi.txt LICENSES-en.txt "
VAR_FILES="description.xml dictionaries.xcu LICENSES-hi.txt LICENSES-en.txt "
#uncomment to debug
set -x

. ../tools/version.sh

# remove any left-over files from prehious build
rm $APP_NAME.oxt
rm -rf $TMP_DIR

# prepare components and defaults
echo "Copying various files to $TMP_DIR folder..."

mkdir -p $TMP_DIR/dictionaries
mkdir -p $TMP_DIR/META-INF

for ROOT_FILE in $ROOT_FILES ; do
  cp -v $ROOT_FILE $TMP_DIR
done

cp META-INF/manifest.xml $TMP_DIR/META-INF/manifest.xml
cp ../Hindi/hi_IN.dic $TMP_DIR/dictionaries/hi_IN.dic 
cp ../Hindi/hi_IN.aff  $TMP_DIR/dictionaries/hi_IN.aff 
cp ../Hindi/CHANGELOG  $TMP_DIR/dictionaries/CHANGELOG

cd $TMP_DIR

if [ -n "$VAR_FILES" ]; then
  echo "Substituting variables for version $VERSION, commit $BLOB on $REV_DATE..."
  for VAR_FILE in $VAR_FILES; do
    if [ -f $VAR_FILE ]; then
      sed -i -e "s/SPELLCHECKERVERSION/$VERSION/" $VAR_FILE
      sed -i -e "s/SPELLCHECKERDATE/$REV_DATE/" $VAR_FILE
    fi
  done
fi

# generate the OXT  file
echo "Generating $APP_NAME.oxt..."
zip -r ../../$APP_NAME.oxt *
zip -r ../../dict-hi_IN.zip *

cd "$ROOT_DIR"

# remove the working files
rm -rf $TMP_DIR
echo "Done!"

