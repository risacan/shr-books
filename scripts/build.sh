#!/bin/sh

set +e

cd mybook
rake pdf
rake pdf:nombre
