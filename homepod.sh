#!/bin/bash

# Get the sink names for HomePod-R and HomePod-L
homepod_r=$(pactl list short sinks | grep -oP "raop_sink\.HomePod-R[^\s]+")
homepod_l=$(pactl list short sinks | grep -oP "raop_sink\.HomePod-L[^\s]+")

# Check if both HomePod-R and HomePod-L sinks are found
if [[ -n "$homepod_r" && -n "$homepod_l" ]]; then
    echo "Found HomePod sinks: $homepod_l (Left) and $homepod_r (Right)"

    # Load the module-combine-sink with left and right channel mapping
    pactl load-module module-combine-sink sink_name=stereo_homepods slaves=$homepod_l,$homepod_r channel_map=left,right

    # Optionally set it as the default sink (uncomment the next line if needed)
    # pactl set-default-sink stereo_homepods

    echo "Stereo sink created successfully."
else
    echo "Error: Could not find both HomePod-R and HomePod-L sinks."
    exit 1
fi
