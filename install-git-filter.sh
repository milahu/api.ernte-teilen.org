#! /usr/bin/env bash

( test -e .gitattributes && grep -q -F -x "*.json diff=json" .gitattributes ) ||
echo "*.json diff=json" >>.gitattributes

( test -e .gitattributes && grep -q -F -x "api.ernte-teilen.org/** diff=json" .gitattributes ) ||
echo "api.ernte-teilen.org/** diff=json" >>.gitattributes

grep -q -F -x '[diff "json"]' .git/config ||
cat >>.git/config <<'EOF'
[diff "json"]
    textconv = "cat $1 | json_pp"
EOF
