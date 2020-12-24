echo ">> Updating python packages"
python -m pip list --format=json --no-python-version-warning --not-required \
| jq -r '.[] | .name' \
| xargs -r python -m pip install -U --no-python-version-warning --upgrade-strategy=eager --user
