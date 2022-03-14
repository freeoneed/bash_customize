#!/bin/bash

echo "[INFO] Start script..."
sudo apt update
echo "[INFO] Update packages complete! Try install..."
sudo apt install ncdu tmux mc htop curl wget git slurm tcpdump -y
echo "[INFO] Instalation complete! Tuning .bashrc file..."
sudo cp custom_conf/.bashrc_custom ~/
sudo cp custom_conf/.tmux.conf ~/
source ~/.bashrc_custom
echo '[INFO] OK! Customize tmux...'
tmux source-file ~/.tmux.conf
echo '[INFO] All done!'
echo '[INFO] Enter "source ~/.bashrc" for complete install or relogin!'
