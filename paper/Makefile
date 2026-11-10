# Build:  make          (pdflatex + bibtex, as on Overleaf)
#         make blind    (anonymous copy for double-blind review: $(PAPER)-blind.pdf)
# Check:  make check    (pending \tbd markers, Type 3 or unembedded fonts, page count, paper size,
#                        and that the blind copy carries no author-identifying text)
PAPER = vlsitsa2027
BLIND = $(PAPER)-blind
FIGS  = figs/afe_top.pdf figs/layout_annotated.pdf
LATEX = pdflatex -interaction=nonstopmode -halt-on-error
# Strings that must not appear in the blind copy (case-insensitive).
IDENT = chaithr|choudary|warangal|nitw|tt-eeg-afe

$(PAPER).pdf: $(PAPER).tex refs.bib $(FIGS)
	$(LATEX) $(PAPER) >/dev/null
	bibtex $(PAPER) >/dev/null
	$(LATEX) $(PAPER) >/dev/null
	$(LATEX) $(PAPER) >/dev/null
	@grep -E "LaTeX Warning|Overfull" $(PAPER).log || true

blind: $(BLIND).pdf

$(BLIND).pdf: $(PAPER).tex refs.bib $(FIGS)
	$(LATEX) -jobname=$(BLIND) '\AtBeginDocument{\blindtrue}\input{$(PAPER)}' >/dev/null
	bibtex $(BLIND) >/dev/null
	$(LATEX) -jobname=$(BLIND) '\AtBeginDocument{\blindtrue}\input{$(PAPER)}' >/dev/null
	$(LATEX) -jobname=$(BLIND) '\AtBeginDocument{\blindtrue}\input{$(PAPER)}' >/dev/null
	@grep -E "LaTeX Warning|Overfull" $(BLIND).log || true

check: $(PAPER).pdf $(BLIND).pdf
	@echo '--- pending \tbd markers in $(PAPER).tex (must be none before submission):'
	@grep -n '\\tbd{' $(PAPER).tex | grep -v newcommand | cut -c1-140 || echo "none"
	@for f in $(PAPER).pdf $(BLIND).pdf; do \
	  echo "--- $$f: fonts that are Type 3 or not embedded (must be none):"; \
	  pdffonts $$f | awk 'NR>2 && ($$0 ~ /Type 3/ || $$(NF-4) != "yes") {print; n++} END {if (!n) print "none"}'; \
	  pdfinfo $$f | grep -E "^(Pages|Page size)"; \
	done
	@echo "--- $(BLIND).pdf: author-identifying text (must be none):"
	@(pdftotext $(BLIND).pdf - ; pdfinfo -meta $(BLIND).pdf ; pdfinfo $(BLIND).pdf) | grep -i -E '$(IDENT)' || echo "none"

clean:
	rm -f $(PAPER).aux $(PAPER).bbl $(PAPER).blg $(PAPER).log $(PAPER).out
	rm -f $(BLIND).aux $(BLIND).bbl $(BLIND).blg $(BLIND).log $(BLIND).out

.PHONY: blind check clean
