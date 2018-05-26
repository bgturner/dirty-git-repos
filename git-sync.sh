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
	| sed 's:.git$::g'
