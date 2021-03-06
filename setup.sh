#!/bin/bash

#ensure that you've already placed a kaggle.json file in your ~/.kaggle/ directory 

module load python
module load singularity

pip install --user kaggle
#The dataset is 27 gb large
ssh dtn2 
kaggle datasets download -p ./data /sanglequang/brats2018
logout
#realistically, you should request a node for this job -- I just don't know what parameters affect zip speed
unzip brats


find . -name "*.nii" -type f -exec gzip {} \;

singularity build tf.sif my-tf.def

sbatch courseproject.slurm
