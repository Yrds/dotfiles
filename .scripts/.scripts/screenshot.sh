#!/bin/bash
_TARGET="$1"
import $_TARGET png:- | xclip -in -selection clipboard -t image/png
