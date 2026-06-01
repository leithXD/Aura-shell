#!/usr/bin/env bash
 
if [[ "$1" != "+" && "$1" != "-" ]]; then
    echo "Verwendung: $0 + | -"
    exit 1
fi
 
CURRENT=$(hyprctl activeworkspace -j | jq '.id')
 
if [[ "$1" == "+" ]]; then
    WORKSPACES=$(hyprctl workspaces -j | jq '[.[].id] | sort | .[]')
    NEXT=""
    for ID in $WORKSPACES; do
        if [ "$ID" -gt "$CURRENT" ]; then
            NEXT=$ID
            break
        fi
    done
    [ -z "$NEXT" ] && NEXT=$(( CURRENT + 1 ))
else
    WORKSPACES=$(hyprctl workspaces -j | jq '[.[].id] | sort | reverse | .[]')
    NEXT=""
    for ID in $WORKSPACES; do
        if [ "$ID" -lt "$CURRENT" ]; then
            NEXT=$ID
            break
        fi
    done
    [ -z "$NEXT" ] && NEXT=$(( CURRENT - 1 ))
    [ "$NEXT" -lt 1 ] && NEXT=1
fi
 
hyprctl dispatch "hl.dsp.focus({ workspace = \"$NEXT\" })"
