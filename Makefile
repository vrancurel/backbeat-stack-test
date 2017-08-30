NS = vrancurel
VERSION ?= latest

.PHONY: build push

build:
	cd kafka ; docker build -t $(NS)/kafka:$(VERSION) .
	cd backbeat ; docker build -t $(NS)/backbeat:$(VERSION) .
	cd s3 ; docker build -t $(NS)/s3:$(VERSION) .

push:
	cd kafka ; docker push $(NS)/kafka:$(VERSION)
	cd backbeat ; docker push $(NS)/backbeat:$(VERSION)
	cd s3 ; docker push $(NS)/s3:$(VERSION)
