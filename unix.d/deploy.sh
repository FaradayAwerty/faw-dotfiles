#!/bin/bash

for i in bashrc bash_profile tmux.conf; do
	ln -snf $(realpath $i) ~/.$(basename $i)
done

