projectName = libfunction
libusbDir = ./libusb-1.0.9
libusbA = libusb-1.0.a
libusbADir = $(libusbDir)/libusb/.libs/$(libusbA)
SourceName = function.c
TargeName = $(projectName).so

testName=test
testSource=$(testName).c
testTarge=$(testName)

ifeq ($(CC), )
	CC = gcc	
endif

$(testTarge):$(testSource) $(TargeName)
	$(CC) $(testSource) -o $(testTarge) ./libfunction.so

$(TargeName):$(SourceName) $(libusbA)
	$(CC) -I$(libusbDir)/libusb $(SourceName) $(libusbA) -fPIC -shared -o $(TargeName) -lpthread -lrt

$(libusbA):
	cd $(libusbDir);./configure --host=$(host) CC=$(CC);make
	cp $(libusbADir) ./$(libusbA)
	

clean:
	rm -f $(TargeName)
	rm -f $(testTarge)
	rm -f $(libusbA)
	cd $(libusbDir);make distclean
