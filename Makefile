
sokol:
	(mkdir -p thirdparty)
	(cd thirdparty; [ -d thirdparty/sokol ] || git clone -b sapp-multiwindow https://github.com/floooh/sokol.git)

clean:
	rm -Rf thirdparty/sokol
