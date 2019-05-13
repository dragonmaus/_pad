#!/bin/sh
tr / '\001' | sort "$@" | tr '\001' /
