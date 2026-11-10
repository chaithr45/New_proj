#!/bin/sh
# Convert the text in matplotlib figure PDFs to vector outlines so the paper
# carries no Type 3 fonts (IEEE PDF eXpress flags them). Images stay lossless.
#
# Usage (from paper/):  tools/outline_fig_fonts.sh figs/afe_top.pdf figs/layout_annotated.pdf
#
# Run it again whenever the figures are regenerated with the scripts in
# tt-eeg-afe/paper/figs (draw_schematic_paper.py, layout_annotated.py).
set -e
for f in "$@"; do
  out="${f%.pdf}.outlined.pdf"
  gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dNoOutputFonts \
     -dCompatibilityLevel=1.5 \
     -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode \
     -dAutoFilterGrayImages=false -dGrayImageFilter=/FlateEncode \
     -dDownsampleColorImages=false -dDownsampleGrayImages=false \
     -dDownsampleMonoImages=false -dPassThroughJPEGImages=true \
     -sOutputFile="$out" "$f"
  mv "$out" "$f"
  echo "outlined: $f"
done
