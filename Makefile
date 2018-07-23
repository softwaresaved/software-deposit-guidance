MD_DIR = markdown
IMAGES_DIR = images
HTML_DIR = html
PDF_DIR = pdf
MD = $(wildcard markdown/*.md)
IMAGES = $(wildcard images/*.png)
HTML = $(patsubst markdown/%.md, $(HTML_DIR)/%.html, $(MD))
PDF = $(patsubst markdown/%.md, $(PDF_DIR)/%.pdf, $(MD))
CONFIG = config.yml
FILTER = ./scripts/filter.py
PANDOC = pandoc
WKHTMLTOPDF = wkhtmltopdf

# Default action is to show what commands are available.
.PHONY : all
all : commands

## clean    : Clean up temporary and auto-generated files.
.PHONY : clean
clean :
	@rm -f $(HTML)
	@rm -f $(PDF)

## html     : Convert MarkDown to HTML.
.PHONY : html
html : $(HTML)

## pdf      : Convert HTML to PDF.
.PHONY : pdf
pdf : $(PDF)

# Convert MarkDown to HTML.
$(HTML_DIR)/%.html : markdown/%.md $(IMAGES) $(CONFIG)
	mkdir -p $(HTML_DIR)
	cp -r images/ $(HTML_DIR)
	PANDOC_CONFIG=$(CONFIG) $(PANDOC) --filter $(FILTER) -t html -o $@ $<

# Convert HTML to PDF.
$(PDF_DIR)/%.pdf : $(HTML_DIR)/%.html
	mkdir -p $(PDF_DIR)
	$(WKHTMLTOPDF) $< $@

## commands : Display available commands.
.PHONY : commands
commands : Makefile
	@sed -n 's/^##//p' $<

## settings : Show variables and settings.
.PHONY : settings
settings :
	@echo 'MD_DIR:' $(MD_DIR)
	@echo 'MD:' $(MD)
	@echo 'IMAGES_DIR:' $(IMAGES_DIR)
	@echo 'IMAGES:' $(IMAGES)
	@echo 'HTML_DIR:' $(HTML_DIR)
	@echo 'HTML:' $(HTML)
	@echo 'PDF_DIR:' $(PDF_DIR)
	@echo 'PDF:' $(PDF)
	@echo 'PANDOC:' $(PANDOC)
	@echo 'WKHTMLTOPDF:' $(WKHTMLTOPDF)
