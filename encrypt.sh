#!/bin/bash
# Encryption script written by RoxNoAnne
# This program encrypts files

# Ask for user input
printf "Enter a file to encrypt and press [ENTER]...\n"
read userFile

# Check for file
if [ ! -f "$userFile" ]; then
	echo "File not found. Exiting..."
	exit 1
fi

# Create a temporary file
tmpfile=$(mktemp /tmp/userFile.XXXXXX)
cat "$userFile" > "$tmpfile"

# Encode to base64

base64 "$tmpfile" > "$userFile"

#  Remove tmpfile and make a new one
rm "$tmpfile"
tmpfile=$(mktemp /tmp/userFile.XXXXXX)
cat "$userFile" > "$tmpfile"

# Shift base64 with ROT-13

cat "$tmpfile" | tr 'A-Za-z' 'N-ZA-Mn-za-m' > "$userFile"

# Remove the temporary file again
rm "$tmpfile"
