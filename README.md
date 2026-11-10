# New_proj

VLSI-TSA / VLSI-DAT 2027 submission: *Neonatal Seizure Detection with a SKY130 EEG Front End and a Bit-Exact FPGA Detector*.

`VLSI_TSA_2027_paper.zip` is the original upload; its contents are unpacked, under version control, in [`paper/`](paper/).

| File | What it is |
|---|---|
| `paper/vlsitsa2027.tex`, `refs.bib`, `figs/` | paper source (IEEEtran, 4 pages) |
| `paper/vlsitsa2027.pdf` | current build, author names shown |
| `paper/vlsitsa2027-blind.pdf` | same paper, anonymised for double-blind review |
| `paper/SUBMISSION_CHECKLIST.md` | the to-do list for submission |
| `paper/REVIEW_NOTES.md` | status of every checklist item, with sources |
| `paper/Makefile` | `make`, `make blind`, `make check` |
| `paper/tools/outline_fig_fonts.sh` | removes Type 3 fonts from regenerated matplotlib figures |

## Build and check

Needs TeX Live with IEEEtran, TikZ, subfig and booktabs (Debian/Ubuntu: `texlive-publishers texlive-pictures texlive-latex-extra`), plus poppler-utils for the checks.

```
cd paper
make          # vlsitsa2027.pdf
make blind    # vlsitsa2027-blind.pdf
make check    # pending [TBD]s, Type 3 / unembedded fonts, pages, identifying text in the blind copy
```

For the anonymous version on Overleaf, change `\blindfalse` to `\blindtrue` near the top of `vlsitsa2027.tex`.
