#!/bin/bash

mod="breadcrumbs-seo-plus"
zip="${mod}.ocmod.zip"

rm -rf "./bin" && mkdir "bin"

cp -v EULA.txt ./src/
cp -v README.md ./src/

cd "./src/"
zip -9 -r ${zip} "./"
mv ${zip} "../bin/"

rm -f EULA.txt README.md
cd ../

hideg ./bin/"${zip}"

echo DONE.
