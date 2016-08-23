#!/bin/sh

## Clone graphene repo and submodules
git clone https://github.com/followmyvote/graphene --recursive
cd graphene

# Configure build
cmake . -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/var/fmv/local -G Ninja

# Build and install
ninja
ninja install

# Set up qbs
qbs-setup-toolchains --detect
qbs-setup-qt --detect
qbs config profiles.qt-5-7-0.baseProfile clang
qbs config defaultProfile qt-5-7-0

## Clone StakeWeightedVoting repo
cd ..
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
rm -rf graphene stakeweightedvoting graphene-ui build.sh
