ASCIIDOCTOR_PDF = asciidoctor-pdf
ASCIIDOCTOR = asciidoctor

ROOT_ASCIIDOC_NAME = LabGit

ROOT_ASCIIDOC = $(ROOT_ASCIIDOC_NAME).adoc
RESULT_PDF = $(ROOT_ASCIIDOC_NAME).pdf

.PHONY: all
all: $(RESULT_PDF)

$(RESULT_PDF): $(ROOT_ASCIIDOC) $(CHAPTERS) $(THEME)
	$(ASCIIDOCTOR_PDF) \
		--out-file='$@' '$<'

.PHONY: clean
clean:
	$(RM) $(RESULT_PDF)
