projectName = libfunction
SourceName = function.c
TargeName = $(projectName).so

testName=test
testSource=$(testName).c
testTarge=$(testName)

ifeq ($(CC), )
	CC = gcc	
endif

$(testTarge):$(testSource) $(TargeName)
	$(CC) $(testSource) -fPIC -o $(testTarge) ./libfunction.so

$(TargeName):$(SourceName) $(libusbA)
	$(CC) $(SourceName) `pkg-config --cflags --libs libusb-1.0` -fPIC -shared -o $(TargeName) -lpthread -lrt

clean:
	rm -f $(TargeName)
	rm -f $(testTarge)
