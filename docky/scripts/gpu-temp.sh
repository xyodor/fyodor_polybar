#!/bin/bash

nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | awk '{print $1"°C"}'