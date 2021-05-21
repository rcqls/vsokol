## V running Cimgui from sokol world 

### install

```v
cd ~/.vmodules
git clone https://github.com/rcqls/vsokol
cd vsokol
make
```

### further specific install

* MacOS: nothing

* Linux: 
```v
## linux 
sudo cp lib/cimgui.so /usr/local/lib 
## add export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH" to your shell config file
```

* Windows (only tested with gitbash): `cp lib/cimgui.dll ~/bin` where `~/bin` is assumed to be in your `PATH` environment variable

### usage

`v -cc gcc -enable-globals run examples/drawing.v`
