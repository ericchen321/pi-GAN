cat_kaggle_dir_path="/media/eric/data_a/cpsc533r/pi-GAN_data/cat/kaggle/"
cat_dest_dir_path="/media/eric/data_a/cpsc533r/pi-GAN_data/cat/kaggle_128x128/"

# create destination dir
(set -x; mkdir -p $cat_dest_dir_path)

for dir_index in {0..6}
do
    # for CAT_00, ..., CAT_06
    cat_img_dir_path=$(echo "${cat_kaggle_dir_path}/CAT_0${dir_index}")
    echo $cat_img_dir_path
    for img_src_path in ${cat_img_dir_path}/*.jpg
    do
        #echo $img_src_path
        # get img height, width
        height=$(identify ${img_src_path} | cut -f 3 -d " " | sed s/.*x//) #height
        width=$(identify ${img_src_path} | cut -f 3 -d " " | sed s/x.*//) #width
        # define region of cropping
        top=$((height / 2 - 64))
        top=${top%.*}
        left=$((width / 2 - 64))
        left=${left%.*}
        # for every cat image, crop to 128x128 and save to dest dir
        img_filename=$(basename "$img_src_path")
        (set -x; convert ${img_src_path} -crop 128x128+$left+$top $cat_dest_dir_path/$img_filename)
    done
done