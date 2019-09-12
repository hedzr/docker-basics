#!/bin/sh

# https://stackoverflow.com/questions/51445846/elastic-search-max-virtual-memory-areas-vm-max-map-count-65530-is-too-low-inc

# max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]

sudo sysctl -w vm.max_map_count=262144
# sudo sysctl -p
