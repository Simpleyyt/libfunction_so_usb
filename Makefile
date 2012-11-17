projectName = function
libusbDir = ./libusb
libusbA = ./libusb-1.0.a
SourceName = $(projectName).c
TargeName = $(projectName).so

testName=test
testSource=$(testName).c
testTarge=$(testName)

$(testTarge):$(testSource) $(TargeName)
	gcc $(testSource) -o $(testTarge) ./$(TargeName)

$(TargeName):$(SourceName)
	 gcc -I $(libusbDir) $(SourceName) $(libusbA) -fPIC -shared -o $(TargeName) -lpthread -lrt

clean:
	rm -f $(TargeName)
	rm -f $(testTarge)
