build:
	go get github.com/mitchellh/gox
	go get -u github.com/golang/dep/cmd/dep
	dep ensure
	$(shell which upx || apt-get install -y upx-ucl)
	gox -os="darwin linux windows" -arch="amd64"
	upx go-getter_*
	mv go-getter_darwin_amd64  go-getter_osx
	mv go-getter_linux_amd64  go-getter
	mv go-getter_windows_amd64.exe  go-getter.exe