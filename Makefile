VERSION = 3.3.2
RELEASE = 1

build:
	docker build -t cmake .

package: build
	docker run -ti cmake
	docker cp $$(docker ps -aq | head -1):/work/cmake_${VERSION}-${RELEASE}_amd64.deb $$PWD
