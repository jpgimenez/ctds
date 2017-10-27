#!/bin/sh -e

if [ -z "$TRAVIS" ]; then
    echo "$0 should only be run in the Travis-ci environment."
    exit 1
fi

if [ "$TRAVIS_OS_NAME" != "osx" ]; then
    make check_${TRAVIS_PYTHON_VERSION};
fi

# build wheel
pip install cibuildwheel==0.6.0
cibuildwheel --output-dir wheelhouse

