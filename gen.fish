pto_gen public/uploads/panorama/photos/12/* -o project.pto
cpfind -o project.pto --multirow --celeste project.pto
cpclean -o project.pto project.pto
linefind -o project.pto project.pto
autooptimiser -a -m -l -s -o project.pto project.pto
pano_modify --canvas=AUTO --crop=AUTO -o project.pto project.pto
hugin_executor --stitching --prefix=prefix project.pto
nona -m PNG -o project project.pto
rm project.pto