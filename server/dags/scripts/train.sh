set -e
REPO_NAME=dog_cat_mlops
LOCAL_REPO_DIRECTORY=$HOME
REPO_OWNER=liamnguyen97

cd $LOCAL_REPO_DIRECTORY/$REPO_NAME
conda activate training_env
conda env list
python ./ml/train.py
echo "Train successfully!"