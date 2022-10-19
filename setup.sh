wget https://s3.amazonaws.com/fast-ai-imageclas/imagenette2-320.tgz
tar -xf imagenette2-320.tgz 

mkdir data
mv imagenette2-320 data

rm imagenette2-320.tgz