
sokol:
	(mkdir -p thirdparty)
	(cd thirdparty; [ -d thirdparty/sokol ] || git clone --recursive https://github.com/floooh/sokol.git)

clean:
	rm -Rf thirdparty/sokol
