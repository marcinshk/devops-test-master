all: build website

build: yaml2json compress

yaml2json:
	@./scripts/yaml2json.sh

compress:
	@./scripts/generate_zip.sh

website:
	@cd terraform && terraform apply
