# docker-testnet
A dockerized testnet for the Stake-Weighted Voting System

[![](https://images.microbadger.com/badges/image/followmyvote/docker-testnet.svg)](https://microbadger.com/images/followmyvote/docker-testnet)

This repository contains a Dockerfile which will create an image with a simple Graphene testnet blockchain consisting of two nodes: a block producing node, and a Follow My Vote backend node. The image also contains the graphene-ui.

On its first startup, a container based on this image will initialize the network for use with the Follow My Vote Stake-Weighted Voting System. Once started, this container can be used to test the Stake-Weighted Voting application.

Some manual browser-side configuration steps are necessary for the graphene-ui. Open the graphene-ui, hosted at port 8080, and enable the web+bts scheme handler (in Chrome, click the diamond icon at the right edge of the omnibar). Next, create a wallet by setting a password, and import the `nathan` account by going to the Settings (top right menu) -> Import -> Select "Import Private Key" in the dropdown -> Paste in the key `5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3`. After this, the wallet should be configured, and the voting app will launch it automatically when it needs to connect to the blockchain.
