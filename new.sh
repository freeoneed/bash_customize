#!/bin/bash


#add repo
if grep -e debian /etc/apt/sources.list; then
    echo "[INFO] Repositpry already exist!"
else
    echo "deb http://ftp.debian.org/debian stretch main contrib non-free" >> /etc/apt/sources.list
    echo "deb-src http://ftp.debian.org/debian stretch main contrib non-free" >> /etc/apt/sources.list
    echo "[INFO] Repository update!"
fi

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

#add bashrc_custom to main bashrc
if grep -e bashrc_custom ~/.bashrc; then
    echo "[INFO] Custom file already exist!"
else
    echo "source ~/.bashrc_custom" >> ~/.bashrc
fi

echo '[INFO] All done!'
echo '[INFO] Enter "source ~/.bashrc" for complete install or relogin!'
