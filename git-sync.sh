#!/bin/bash
find ~ -type d \
	-not \( -path '*/.vim*/*' -prune \) \
	-not \( -path '*/.emacs.d/*' -prune \) \
	-not \( -path '*/.fzf/*' -prune \) \
	-not \( -path '*/.cargo/*' -prune \) \
	-not \( -path '*/.oh-my-zsh/*' -prune \) \
	-not \( -path '*/.nvm/*' -prune \) \
	-not \( -path '*/.Trash/*' -prune \) \
	-not \( -path '*/Library/*' -prune \) \
	-not \( -path '*/Downloads/*' -prune \) \
	-name "*.git" \
| sed 's:.git$::g' \
| while read f
do
	cd "$f"
	# Testing in a way that is somewhat performant. See:
	# https://stackoverflow.com/questions/12137431/test-if-a-command-outputs-an-empty-string
	if [[ $(git status --porcelain | head -c1 | wc -c) -ne 0 ]];
	then
		# Repo is dirty
		echo "$f"
		git status --porcelain
		echo
	fi
done

