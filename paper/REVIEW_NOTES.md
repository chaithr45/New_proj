# Review notes: status of SUBMISSION_CHECKLIST.md (10 Nov 2026)

Legend: **Done**, **Partly**, **Open** (needs data or a decision from the author).

## Fill in

| # | Item | Status |
|---|---|---|
| 1 | Table III, three rows from E10 (B, C, E) | **Open**: needs the E10 results. They are not in this repository or in `tt-eeg-afe`. |
| 2 | Abstract and Sec. VI-C: E10-B sensitivity, FA/h, 0.5–20 Hz AFE noise | **Open**: needs E10. The abstract placeholder now ends "at [E10-B FA/h] false alarms per hour", so the unit is already there. See the noise cross-check below. |
| 3 | Sec. VI-C: what the no-filter and f_L-mismatch rows show | **Open**: needs E10-C and E10-E. |
| 4 | Sec. VI-B: E11 time per frame on the Cortex-A53 | **Open**: delete the sentence if E11 is not ready by 19 Nov. |

**Noise cross-check for item 2.** Integrating the post-layout input-referred noise over 0.5–20 Hz (from `tt-eeg-afe/design/results/postlayout_curves.json` and `postlayout_combined_curves.json`, layout curves, trapezoid rule) gives:

| Models | Single-ended channel | Bipolar derivation (×√2) |
|---|---|---|
| Original SKY130 models | 2.44 µVrms | 3.45 µVrms |
| Continuous SKY130 models | 2.52 µVrms | 3.57 µVrms |

These figures are before aliasing. With the 40-Hz filter, folding adds very little, so E10's figure should be close to 3.5 µVrms. If E10 reports something much larger, check the noise injection or the folding step before putting the number in the paper.

## Check before submitting

### 5. Resources and power: **Open**
This needs the Vivado utilisation and power reports of the exact bitstream that ran on the board. The paper says 53 mW; the board session quoted 54 mW. Neither repository I could read contains those reports.

The arithmetic in the text is self-consistent:
- 9,592 / 117,120 LUTs = 8.19 %
- 62 / 1,248 DSPs = 4.97 %
- 2,399 cycles at 100 MHz = 24.0 µs, which is 0.614 % of the 390,625-cycle budget

### 6. Call for papers: **Partly**
The 2027 call was not found online. The official site (expo.itri.org.tw) is blocked by this session's network, so everything below comes from search-engine summaries of the **2026** pages:

- **Deadline.** 2026 papers were due 16 Nov 2025, extended to 7 Dec 2025, 23:59 GMT+8. Nothing found confirms the 22 Nov 2026 date in the checklist.
- **VLSI-DAT 2026 rules.**
  - 2 or 4 pages including references, two-column IEEE style, PDF.
  - Non-compliant papers are rejected without review.
  - **Double-blind: no author names, affiliations or e-mail.**
- **VLSI-TSA 2026.** 2-page papers on device and process technology, so a poor fit for this paper.
- **Track.** VLSI-DAT. Candidate topics: "Medical/Bio-electronics/Bio-inspired Chip Designs" (umbrella), "Sensor and Interface Circuits" (AFE) and "Hardware-efficient AI Methods" (detector).
- **Final version.** IEEE PDF eXpress is needed only for the final paper after acceptance (both tracks). The DAT submission is not the published version.
- **Other rules.**
  - Submission is through the symposium's own site, not EDAS.
  - Papers must be "original and unpublished"; no explicit concurrent-submission rule or AI-disclosure rule was found.
  - Accepted papers are presented in person, in English.

**Action:** read the 2027 call. If DAT is still double-blind, submit `vlsitsa2027-blind.pdf` (built by `make blind`), or set `\blindtrue` in the `.tex` on Overleaf. That hides:
- the author block
- the GitHub footnote (replaced by "will be made public after review")
- "The author" in the acknowledgment

`make check` confirms the blind PDF contains no name, affiliation, e-mail or repository link.

### 7. Comparison numbers: **Partly**
These were checked from search-engine text of the primary pages (abstracts, arXiv/PMC full text, author copies). No PDF was opened directly, because the network allowlist blocks the hosts.

| Ref | Result |
|---|---|
| [7] Shoaran 2018 | **All cells verified.** 65 nm, GBT, iEEG from 26 patients, F1 87.86 % block-wise (99.23 % random split), 41.2 nJ/class (at 0.8 V), 1.1 s average detection latency. |
| [8] NeuralTree 2022 | Verified: 65 nm, oblique tree, CHB-MIT 24 patients, per-patient, sens. 95.6 % / spec. 96.8 % (EEG), 0.227 µJ/class. **Check** Table II of the paper for a latency entry (possibly "<1 s") before leaving "–". |
| [9] Busia 2025 | Verified: iCE40UP5K, SNN, 9 CHB-MIT patients (chb01–11 without chb04 and chb06), per-patient, 100 % of events, 0.3 FP/h, 0.5 µs **inference time**. **9.1 mW is the power during the 0.5-µs inference burst. Average real-time power is about 0.25 mW, dominated by idle.** Whether 9.1 mW was measured was not confirmed. Check the full text and consider "9.1 mW during inference" or the average figure instead of "(meas.)". |
| [10] Harrison 2003 | Verified: 1.5 µm, ±2.5 V, 39.5 dB, 2.2 µVrms, 80 µW, NEF 4.0, 0.16 mm². The noise integration band was not confirmed; the amplifier band is 0.025 Hz–7.2 kHz. |
| [11] Lee 2019 | Verified from the abstract: 65 nm, 0.8 V, PEF 8.8. **Unverified:** 0.38 µVrms (0.5–100 Hz), 4.5 µW and NEF 3.32 appear only in a secondary comparison table (they are consistent with PEF 8.8 at 0.8 V). **"Chopper" is unconfirmed:** the abstract describes a current-reusing LNA with a bootstrapped DC servo loop. If it is not a chopper design, fix Table I and the sentence in Sec. III-B ("the chopper designs of [11], [12]"). |
| [12] Park 2022 | Verified: 110 nm, chopper, 0.36 µVrms over 0.5–300 Hz, 3.83 µW per channel, NEF 1.54. **The supply was wrong: "at 1 and 1.5-V supplies". Fixed to 1/1.5.** |

Changes made from this check:
- Table I: Park supply changed from 1 to 1/1.5 V.
- Table IV: [7]'s 1.1 s is a detection delay, while the other entries are processing times. A footnote now says so.
- refs.bib: Busia 2025 now has vol. 19, no. 6, Dec. 2025. Pages 1175–1186 come from secondary sources only; add them after checking IEEE Xplore.

Bibliographic details (volume, number, pages, year) of [7], [8], [10], [11] and [12] were confirmed.

### 8–12: author actions
- 8: faculty review. 10: no parallel submission of the detector paper. 11: submit a day early. 12: update CV/SOP after submitting.
- 9: **fonts done.** The two matplotlib figures embedded Type 3 fonts (DejaVuSans, STIXGeneral, TeXGyreTermes). Their text is now outlined; the layout image is unchanged (lossless) and the rendering is the same. `make check` reports no Type 3 or unembedded fonts. If the figures are regenerated in `tt-eeg-afe/paper/figs`, run `tools/outline_fig_fonts.sh` on them again.

## Other findings

- **Fixed.** In ref. [12], "15-GΩ" printed as "15-Gω": BibTeX lowercased the unbraced `$\Omega$`. It is now braced.
- **Checked against `tt-eeg-afe/design/results` (post-layout).** Every number below matches:
  - gain 37.756 dB
  - noise 2.952 µVrms (0.5–100 Hz)
  - PSRR 85.6 dB typical, at least 81.1 dB over all layout corners
  - parasitic change −0.035 to −0.037 dB in gain and +0.016 to +0.023 µVrms in noise
  - 15.7 µA at 1.8 V = 28 µW
  - tile 161 × 225.76 µm = 0.036 mm²
- **Checked as internally consistent:**
  - 77.5 V/V = 37.8 dB
  - 100 trees × 15 nodes = 1,500 model words
  - 3 × 36 = 108 features
  - 46 − 33 = 13 neonates missed
  - 49.8 − 47.8 = 2 points
- **Suggestions, not applied:**
  - Cite `hjorth1970` for the Hjorth parameters and `steyaert1987` for NEF. Both are already in refs.bib.
  - `nagarajan2021` (neonatal seizure detection on ultra-edge devices) and `vittimberga2025` (threshold detector for low-complexity hardware) are in refs.bib but not cited. Check that neither undercuts "the first neonatal seizure detector in FPGA logic evaluated patient-independently", and consider citing nagarajan2021 next to the workstation-software sentence.
