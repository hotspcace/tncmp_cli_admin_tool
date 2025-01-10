#!/bin/bash

# Install jq if not present
# sudo apt-get install jq

# Set the input file and desired chunk size
input_file="final_fixed.json"
chunk_size=1000 

# Create a temporary directory for the chunks
mkdir -p chunks

# Split the JSON file into chunks
jq -c --stream 'reduce range(0;length) as $i ({}; . + {($i): input}) | to_entries[] | select(.key % $chunk_size == 0) | .value' $input_file | \
  while read chunk; do
    # Write each chunk to a separate file
    echo "$chunk" > "chunks/chunk_$((++i)).json"
  done

# Process each chunk
for chunk_file in chunks/*; do
    # Send the chunk to the API
    #curl -X POST -H "Content-Type: application/json" -d @$chunk_file "https://your-api-endpoint"
    curl -s -k --cookie mycookie -X POST -H "Content-Type: application/json" -d @$chunk_file "https://dashboard-tncmp.apps.tncmp-dev.ftr.com/inventory/rest/topology/resources/create"
done

# Clean up
rm -rf chunks
