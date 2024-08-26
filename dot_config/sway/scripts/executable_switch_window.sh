#!/usr/bin/env bash
#https://gist.github.com/pedroxs/f0ee8c515eea0dbce2e23eea7c048e10
#https://github.com/jqlang/jq/issues/2062
#https://stackoverflow.com/questions/35365769/how-do-i-use-jq-to-convert-number-to-string
#https://stackoverflow.com/questions/2440414/how-can-i-retrieve-the-first-word-of-the-output-of-a-command-in-bash
swaymsg -rt get_tree |
    jq '..  | objects | select((.type=="con") or (.type=="floating_con") and (.parent!=null)) | select(.layout=="none") | pick(("id", "name") as $k | select(has($k))[$k])' |
    jq -r '(.id|tostring) + " " + .name' |
    tofi --prompt-text=" Window: "|
    swaymsg [con_id=$(awk '{print $1;}')] focus 
