#!/bin/bash

  BOLD="\e[1m"
ITALIC="\e[3m"
 ENDWE="\e[0m"

echo
echo  "[Normal     ]:"
echo -e                 "   abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ"
echo -e                 "   0123456789                 \`~!@\#$%^&*()-=_+[]{}\|;:'\"<>,./?"
echo
echo  "[Bold       ]:"
echo -e          "   ${BOLD}abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ${ENDWE}"
echo -e          "   ${BOLD}0123456789                 \`~!@\#$%^&*()-=_+[]{}\|;:'\"<>,./?${ENDWE}"
echo
echo  "[Italic     ]:"
echo -e        "   ${ITALIC}abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ${ENDWE}"
echo -e        "   ${ITALIC}0123456789                 \`~!@\#$%^&*()-=_+[]{}\|;:'\"<>,./?${ENDWE}"
echo
echo  "[Italic Bold]:"
echo -e "   ${ITALIC}${BOLD}abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ${ENDWE}${ENDWE}"
echo -e "   ${ITALIC}${BOLD}0123456789                 \`~!@\#$%^&*()-=_+[]{}\|;:'\"<>,./?${ENDWE}${ENDWE}"
echo
echo
echo  "[normal symbols]:"
echo  "   whitespace = 'Ξ'" "notexists     = 'Ɇ'"
echo  "   paste      = 'Þ'" "linenr        = '¶'"
echo
echo  "[powerline symbols]:"
echo  "    left_sep  = ''" " left_alt_sep = ''"
echo  "   right_sep  = ''" "right_alt_sep = ''"
echo  "   branch     = ''" "readonly      = ''"
echo  "   maxlinenr  = ''"
echo
echo  "[old vim-powerline symbols]:"
echo  "    left_sep = '⮀'"  " left_alt_sep = '⮁'"
echo  "   right_sep = '⮂'"  "right_alt_sep = '⮃'"
echo  "   branch    = '⭠'"  "readonly      = '⭤'"
echo  "   maxlinenr = '⭡'"
