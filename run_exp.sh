#!/bin/bash

# Default values
DIR="defaultDIR"
CONF="defaultConf"

# Parse named arguments
for arg in "$@"; do
  case $arg in
    --dir=*)
      DIR="${arg#*=}"
      shift # Remove --dir= from processing
      ;;
    --exp=*)
      EXP="${arg#*=}"
      shift # Remove --exp= from processing
      ;;
    --conf=*)
      CONF="${arg#*=}"
      shift # Remove --conf= from processing
      ;;
    *)
      # Unknown option
      ;;
  esac
done

echo "Dir: $DIR"
echo "Config: $CONF"

cd $DIR
python train.py --config ${CONF} --load_ckpt
python inference.py --config ${CONF} --load best_model.ckpt --whole
