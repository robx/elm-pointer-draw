#!/bin/sh

pkg=$1
version=$2
repo=$3

buildbase=elm-stuff/build-artifacts/0.18.0
pkgbase=elm-stuff/packages

rm -rf $pkgbase/$pkg/$version
rm -rf $buildbase/$pkg/$version
ln -s $repo $pkgbase/$pkg/$version
ln -s $repo/$buildbase/$pkg/$version $buildbase/$pkg/$version
