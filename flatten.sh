#!/usr/bin/env bash

CDIR=$(dirname "$0")
rm "$CIDR"/../tempsource/*
find "$CDIR" -name \*.c -exec cp {} "$CDIR"/../tempsource/ \;
find "$CDIR" -name \*.h -exec cp {} "$CDIR"/../tempsource/ \;

