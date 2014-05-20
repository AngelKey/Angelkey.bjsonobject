default: build
all: build

ICED=node_modules/.bin/iced
BUILD_STAMP=build-stamp
TEST_STAMP=test-stamp


lib/%.js: src/%.iced
	$(ICED) -I node -c -o `dirname $@` $<

$(BUILD_STAMP): \
	lib/decode.js \
	lib/encode.js \
	lib/parse.js \
	lib/mime.js \
	lib/main.js \
	lib/http.js \
	lib/checkers.js \
	lib/template.js \
	lib/const.js
	date > $@

clean:
	find lib -type f -name *.js -exec rm {} \;

test:
	cd test && iced run.iced

build: $(BUILD_STAMP) 

setup: 
	npm install -d

test:

.PHONY: test setup

