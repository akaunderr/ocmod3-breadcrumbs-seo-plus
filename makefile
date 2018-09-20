# Copyright 2018 Andrii Burkatskyi aka underr

dir=$(shell pwd)
zip=$(shell basename $(dir)).ocmod.zip

license=LICENSE.txt
eula=EULA.txt
readme=README.md

src=src
bin=bin




all: checkg clean makedir makezip addtext hideg

checkg:
	@if [ ! -f "hideg.pwd" ]; then hideg; fi

makedir:
	mkdir -p "$(bin)"

makezip:
	cd "$(src)" && zip -9 -r "../$(bin)/$(zip)" * && cd ..

addtext:
	zip -9 -j "$(bin)/$(zip)" "$(readme)" "$(license)" "$(eula)"
	# @if [ -f "$(license)" ]; then zip -9 -j "$(bin)/$(zip)" "$(license)"; elif [ -f "$(eula)" ]; then zip -9 -j "$(bin)/$(zip)" "$(eula)"; fi

hideg: hideg.pwd
	hideg "$(bin)/$(zip)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(src)"/*.zip
	@rm -f "$(src)/$(eula)"
	@rm -f "$(src)/$(license)"
	@rm -f "$(src)/$(readme)"
