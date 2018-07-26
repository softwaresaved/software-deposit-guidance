MDS = $(wildcard markdown/*.md)
IMAGES = $(wildcard images/*.png)
CSS = css/style.css
PRECONFIG = preconfig.yml
CONFIG = config.yml
FILTER = scripts/replace_tokens.py
TEMPLATE = templates/doc.html
PANDOC = pandoc
WKHTMLTOPDF = wkhtmltopdf

BUILD_DIR = build
BUILD_CONFIG=$(BUILD_DIR)/$(CONFIG)
BUILD_MD_DIR = $(BUILD_DIR)/markdown
BUILD_HTML_DIR = $(BUILD_DIR)/html
BUILD_PDF_DIR = $(BUILD_DIR)/pdf
BUILD_MD = $(patsubst markdown/%.md, $(BUILD_MD_DIR)/%.md, $(MDS))
BUILD_HTML = $(patsubst markdown/%.md, $(BUILD_HTML_DIR)/%.html, $(MDS))
BUILD_PDF = $(patsubst markdown/%.md, $(BUILD_PDF_DIR)/%.pdf, $(MDS))

# Default action is to show what commands are available.
.PHONY : all
all : commands

## clean     : Clean up temporary and auto-generated files.
.PHONY : clean
clean :
	@rm -rf $(BUILD_DIR)

## preconfig : Replace tokens in configuration with preconfiguration values.
$(BUILD_CONFIG) : $(FILTER) $(PRECONFIG) $(CONFIG) 
	mkdir -p $(BUILD_DIR)
	python $^ $@

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
$(BUILD_MD_DIR)/%.md : $(FILTER) $(BUILD_CONFIG) markdown/%.md
	mkdir -p $(BUILD_MD_DIR)
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
	@echo 'PRECONFIG:' $(PRECONFIG)
	@echo 'CONFIG:' $(CONFIG)
	@echo 'FILTER:' $(FILTER)
	@echo 'TEMPLATE:' $(TEMPLATE)
	@echo 'PANDOC:' $(PANDOC)
	@echo 'WKHTMLTOPDF:' $(WKHTMLTOPDF)
	@echo 'BUILD_DIR:' $(BUILD_DIR)
	@echo 'BUILD_CONFIG:' $(BUILD_CONFOG)
	@echo 'BUILD_MD_DIR:' $(BUILD_MD_DIR)
	@echo 'BUILD_HTML_DIR:' $(BUILD_HTML_DIR)
	@echo 'BUILD_PDF_DIR:' $(BUILD_PDF_DIR)
	@echo 'BUILD_MD:' $(BUILD_Md)
	@echo 'BUILD_HTML:' $(BUILD_HTML)
	@echo 'BUILD_PDF:' $(BUILD_PDF)
