BUILD_DIR = build
BUILD_MD_DIR = $(BUILD_DIR)/markdown
BUILD_HTML_DIR = $(BUILD_DIR)/html
BUILD_PDF_DIR = $(BUILD_DIR)/pdf

MDS = $(wildcard markdown/*.md)
IMAGES = $(wildcard images/*.png)
BUILD_MD = $(patsubst markdown/%.md, $(BUILD_MD_DIR)/%.md, $(MDS))
BUILD_HTML = $(patsubst markdown/%.md, $(BUILD_HTML_DIR)/%.html, $(MDS))
BUILD_PDF = $(patsubst markdown/%.md, $(BUILD_PDF_DIR)/%.pdf, $(MDS))

CONFIG = config.yml
CONFIG_SCRIPT = scripts/configure.py
TEMPLATE = templates/doc.html

PANDOC = pandoc
WKHTMLTOPDF = wkhtmltopdf

# Default action is to show what commands are available.
.PHONY : all
all : commands

## clean    : Clean up temporary and auto-generated files.
.PHONY : clean
clean :
	@rm -rf $(BUILD_DIR)

## markdown : Replace tokens in Markdown with configuration values.
.PHONY : markdown
markdown : $(BUILD_MD)

## html     : Convert MarkDown to HTML.
.PHONY : html
html : $(BUILD_HTML)

## pdf      : Convert HTML to PDF.
.PHONY : pdf
pdf : $(BUILD_PDF)

# Replace tokens in Markdown with configuration values.
$(BUILD_MD_DIR)/%.md : markdown/%.md $(CONFIG) $(FILTER)
	mkdir -p $(BUILD_MD_DIR)
	python $(CONFIG_SCRIPT) $(CONFIG) $< $@

# Convert MarkDown to HTML.
$(BUILD_HTML_DIR)/%.html : $(BUILD_MD_DIR)/%.md $(IMAGES) $(TEMPLATE)
	mkdir -p $(BUILD_HTML_DIR)
	cp -r images/ $(BUILD_HTML_DIR)
	$(PANDOC) -t html -o $@ $<
	# PANDOC_CONFIG=$(CONFIG) $(PANDOC) -t html --filter $(FILTER) -o $@ $<
	# $(PANDOC) -t html --template=$(TEMPLATE) -o $@ $<

# Convert HTML to PDF.
$(BUILD_PDF_DIR)/%.pdf : $(BUILD_HTML_DIR)/%.html
	mkdir -p $(BUILD_PDF_DIR)
	$(WKHTMLTOPDF) $< $@

## commands : Display available commands.
.PHONY : commands
commands : Makefile
	@sed -n 's/^##//p' $<

## settings : Show variables and settings.
.PHONY : settings
settings :
	@echo 'BUILD_MD_DIR:' $(BUILD_MD_DIR)
	@echo 'BUILD_HTML_DIR:' $(BUILD_HTML_DIR)
	@echo 'BUILD_PDF_DIR:' $(BUILD_PDF_DIR)
	@echo 'MDS:' $(MDS)
	@echo 'IMAGES:' $(IMAGES)
	@echo 'BUILD_MD:' $(BUILD_Md)
	@echo 'BUILD_HTML:' $(BUILD_HTML)
	@echo 'BUILD_PDF:' $(BUILD_PDF)
	@echo 'CONFIG:' $(CONFIG)
	@echo 'FILTER:' $(FILTER)
	@echo 'TEMPLATE:' $(TEMPLATE)
	@echo 'PANDOC:' $(PANDOC)
	@echo 'WKHTMLTOPDF:' $(WKHTMLTOPDF)
