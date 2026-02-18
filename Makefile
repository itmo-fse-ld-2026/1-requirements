filepath=report/
filename=main

clean:
	for file_ext in "*.pdf" "*.aux" "*.log" "*.toc" "*.out"; do \
		find $(filepath) -name "$${file_ext}" -delete; \
	done
pdf:
	cd "${filepath}"; \
	xelatex "${filename}.tex"; \
	xelatex "${filename}.tex"