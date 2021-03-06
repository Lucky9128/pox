#!/bin/bash

# This script is to restore all Inception configurations of Open
# vSwitch to default

BRIDGE_NAME=obr1

# Deconnect from the controller
sudo ovs-vsctl del-controller $BRIDGE_NAME

# Delete fail-mode. When connection to the controller is lost,
# The virtual switch will act like a traditional switch
sudo ovs-vsctl del-fail-mode $BRIDGE_NAME

# Delete all Openflow flows
sudo ovs-ofctl del-flows $BRIDGE_NAME

# Add a flow for normal operation
sudo ovs-ofctl add-flow $BRIDGE_NAME "table=0, actions=NORMAL"
