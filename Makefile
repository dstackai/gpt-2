download_model:
	docker run -it --rm -v $(pwd):/dstack-run-1 -w /dstack-run-1 tensorflow/tensorflow:1.15.0-py3 bash -c "pip3 install -r requirements.txt; python3 download_model.py 124M"
prepare_dataset:
	docker run -it --rm -v $(pwd):/dstack-run-1 -w /dstack-run-1 tensorflow/tensorflow:1.15.0-py3 bash -c "curl -O https://github.com/karpathy/char-rnn/blob/master/data/tinyshakespeare/input.txt; pip3 install -r requirements.txt; PYTHONPATH=src ./encode.py --model_name 124M input.txt input.npz"
finetune_model:
	docker run -it --rm -v $(pwd):/dstack-run-1 -w /dstack-run-1 tensorflow/tensorflow:1.15.0-py3 bash -c "pip3 install -r requirements.txt; PYTHONPATH=src python3 train.py --model_name 124M --dataset input.npz"