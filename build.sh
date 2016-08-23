#!/bin/sh

# Set up qbs
qbs-setup-toolchains --detect
qbs-setup-qt --detect
qbs config profiles.qt-5-7-0.baseProfile clang
qbs config defaultProfile qt-5-7-0

## Clone StakeWeightedVoting repo
git clone https://github.com/followmyvote/stakeweightedvoting
cd stakeweightedvoting

# Build and install
GRAPHENE_PATH=/var/fmv/local qbs install -p GrapheneBackend debug qbs.installRoot:/var/fmv/local project.ignoreApp:true
cp GrapheneBackend/InitChain.script /var/fmv

## Clone graphene-ui repo
cd ..
git clone https://github.com/followmyvote/graphene-ui
cd graphene-ui/dl

# Install dependencies
npm install
cd ../web
npm install

# Build for production
npm run build

# Move built assets out of source hierarchy
mv dist ../../gui

# Install a simple web server to host the GUI
cd ../../gui
npm install http-server

# Clean up (makes the image much much smaller)
cd ..
rm -rf stakeweightedvoting graphene-ui build.sh
