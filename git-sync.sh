#!/bin/bash
find ~ -type d \
	-name "*.git" \
	| sed 's:.git$::g'
