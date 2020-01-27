print ">> Updating python packages"
pip install -U --user pip
pip list -o --format=json | jq -r '.[] | .name' | tr '\n' '\0' | xargs -0r pip install -U --user
