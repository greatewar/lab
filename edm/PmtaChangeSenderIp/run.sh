#!/bin/bash

# Define variables
service pmta stop
PmtaChangeSenderIp
service pmta start
