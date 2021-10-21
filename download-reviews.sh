#!/bin/bash
set -euo pipefail

# note: when import to Google Drive, change the separator to 'semicolon'
function reviews() {
	curl https://itunes.apple.com/us/rss/customerreviews/page=$1/id=547702041/sortBy\=mostRecent/json |
	  jq -r '.feed.entry | .[] | "\(.updated.label); \(.["im:rating"].label); \(.["im:version"].label); \(.title.label); \(.content.label)" | gsub("[\\n\\t]"; "")' >> reviews.csv
}

rm reviews.csv
echo 'updated; rating; version; title; body' >> reviews.csv
reviews 1
reviews 2
reviews 3
reviews 4
reviews 5
reviews 6
reviews 7
reviews 8
reviews 9
reviews 10
