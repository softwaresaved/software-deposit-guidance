MDS = $(wildcard markdown/*.md)
IMAGES = $(wildcard images/*.png)
CSS = css/style.css
CONFIG = config.yml
FILTER = scripts/replace_tokens.py
TEMPLATE = templates/doc.html
PANDOC = pandoc
WKHTMLTOPDF = wkhtmltopdf
LINK_CHECKER = linkchecker --check-extern

BUILD_DIR = build
BUILD_MD_DIR = $(BUILD_DIR)/markdown
BUILD_HTML_DIR = $(BUILD_DIR)/html
BUILD_PDF_DIR = $(BUILD_DIR)/pdf
BUILD_MD = $(patsubst markdown/%.md, $(BUILD_MD_DIR)/%.md, $(MDS))
BUILD_HTML = $(patsubst markdown/%.md, $(BUILD_HTML_DIR)/%.html, $(MDS))
BUILD_PDF = $(patsubst markdown/%.md, $(BUILD_PDF_DIR)/%.pdf, $(MDS))
LINK_REPORT = $(BUILD_DIR)/link-check.txt

# Default action is to show what commands are available.
.PHONY : all
all : commands

## clean     : Clean up temporary and auto-generated files.
.PHONY : clean
clean :
	@rm -rf $(BUILD_DIR)

## markdown  : Replace tokens in Markdown with configuration values.
.PHONY : markdown
markdown : $(BUILD_MD)

## html      : Convert Markdown to HTML.
.PHONY : html
html : $(BUILD_HTML)

## pdf       : Convert HTML to PDF.
.PHONY : pdf
pdf : $(BUILD_PDF)

# Replace tokens in Markdown with configuration values.
$(BUILD_MD_DIR)/%.md : $(FILTER) $(CONFIG) markdown/%.md
	mkdir -p $(BUILD_MD_DIR)
	echo python $^ $@
	python $^ $@

# Convert Markdown to HTML.
$(BUILD_HTML_DIR)/%.html : $(BUILD_MD_DIR)/%.md $(IMAGES) $(TEMPLATE) $(CSS)
	mkdir -p $(BUILD_HTML_DIR)
	cp -r images/ $(BUILD_HTML_DIR)
	cp -r css/ $(BUILD_HTML_DIR)
	# $(PANDOC) -t html -o $@ $<
	$(PANDOC) -t html -c $(CSS) --template=$(TEMPLATE) -o $@ $<

# Convert HTML to PDF.
$(BUILD_PDF_DIR)/%.pdf : $(BUILD_HTML_DIR)/%.html
	mkdir -p $(BUILD_PDF_DIR)
	$(WKHTMLTOPDF) $< $@

## check-links  : Check HTML links.
.PHONY : check-links
check-links : $(HTML)
	$(LINK_CHECKER) $(BUILD_HTML_DIR)/*.html > $(LINK_REPORT)

## commands  : Display available commands.
.PHONY : commands
commands : Makefile
	@sed -n 's/^##//p' $<

## settings  : Show variables and settings.
.PHONY : settings
settings :
	@echo 'MDS:' $(MDS)
	@echo 'IMAGES:' $(IMAGES)
	@echo 'CSS:' $(CSS)
	@echo 'CONFIG:' $(CONFIG)
	@echo 'FILTER:' $(FILTER)
	@echo 'TEMPLATE:' $(TEMPLATE)
	@echo 'PANDOC:' $(PANDOC)
	@echo 'WKHTMLTOPDF:' $(WKHTMLTOPDF)
	@echo 'LINK_CHECKER:' $(LINK_CHECKER)
	@echo 'BUILD_DIR:' $(BUILD_DIR)
	@echo 'BUILD_MD_DIR:' $(BUILD_MD_DIR)
	@echo 'BUILD_HTML_DIR:' $(BUILD_HTML_DIR)
	@echo 'BUILD_PDF_DIR:' $(BUILD_PDF_DIR)
	@echo 'BUILD_MD:' $(BUILD_Md)
	@echo 'BUILD_HTML:' $(BUILD_HTML)
	@echo 'BUILD_PDF:' $(BUILD_PDF)
	@echo 'LINK_REPORT:' $(LINK_REPORT)
