# VLSI TSA 2027 submission checklist (deadline 22 Nov 2026, 23:59 Taiwan = 21:29 IST)

## Fill in (every red [ ] in the PDF)
1. Table III, three rows "Built detector behind the AFE model": from E10 (conditions B, C, E).
2. Abstract, last sentence, and Sec. VI-C: E10-B sensitivity and FA/h, and the 0.5-20 Hz AFE noise per bipolar derivation.
3. Sec. VI-C, last sentence: what the no-filter and f_L-mismatch rows show.
4. Sec. VI-B: C on the Cortex-A53, median and maximum time per frame (E11). If E11 is not ready by Nov 19, delete that sentence.

## Check before submitting
5. Resources and power: the paper uses 9,592 LUTs, 10,494 FFs, 62 DSPs, 4 BRAM36 and 53 mW (Vivado). Confirm these against the reports of the exact bitstream that ran on the board (the board session quoted 54 mW).
6. The 2027 call for papers: page limit (2026 allowed 2 or 4 pages including references), which track to pick (DAT: analog/mixed-signal, or biomedical / hardware-efficient AI), and whether the uploaded PDF is final (in 2026 papers were published as submitted).
7. Comparison numbers: open the PDFs of [7] Shoaran 2018 (per-patient training, F1 87.86% block-wise, 41.2 nJ/class, 1.1 s latency), [8] NeuralTree (95.6% / 96.8% on CHB-MIT, 0.227 uJ/class), [9] Busia 2025 (iCE40UP5K, 9.1 mW measured, 0.5 us, 0.3 FP/h), [11] Lee 2019 and [12] Park 2022 (noise, power, NEF), and correct any cell that differs.
8. Faculty review by Nov 19. Add a co-author only if they contribute to the work or the manuscript.
9. Run the PDF through IEEE PDF eXpress if the call asks for it; all fonts embedded.
10. Keep the detector-only FPGA paper out of review elsewhere while this one is under review. The full noise-tolerance study goes to EMBC (24 Jan 2027) as a separate paper.
11. Submit by Nov 21, one day early.
12. Only after submitting, change the CV/SOP line to "submitted to VLSI TSA 2027".

## Build
pdflatex + bibtex (or Overleaf): vlsitsa2027.tex, refs.bib, figs/afe_top.pdf, figs/layout_annotated.pdf.
