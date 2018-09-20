# Breadcrumbs SEO+ v1.1 (https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=35022)
# Copyright 2018 Andrii Burkatskyi aka underr
# EULA - https://raw.githubusercontent.com/underr-ua/ocmod3-breadcrumbs-seo-plus/master/EULA.txt

zip=$(shell basename `pwd`).ocmod.zip

eula=EULA.txt
readme=README.md
datetime=201801010000.00
src=src
bin=bin


all: checkg clean makedir timestamp makezip hideg

checkg:
	@if [ ! -f "hideg.pwd" ]; then hideg; fi

makedir:
	mkdir -p "$(bin)"

timestamp:
	find . -exec touch -a -m -t $(datetime) {} \;

makezip:
	cd "$(src)" && zip -9qrX "../$(bin)/$(zip)" * && cd .. && zip -9qrX "$(bin)/$(zip)" "$(readme)" "$(eula)"

hideg: hideg.pwd
	hideg "$(bin)/$(zip)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(src)"/*.zip
	@rm -f "$(src)/$(eula)"
	@rm -f "$(src)/$(readme)"
