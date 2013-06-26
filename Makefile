all: img2simg mkbootimg

img2simg:
	mkdir -p bin
	gcc -g droid-extras/ext4_utils/img2simg.c -o bin/img2simg

mkbootimg:
	mkdir -p bin
	gcc -I droid-core/include/ -g droid-core/mkbootimg/mkbootimg.c -g droid-core/libmincrypt/sha.c -o bin/mkbootimg

install:
	mkdir -p $(DESTDIR)/usr/bin/
	cp bin/* $(DESTDIR)/usr/bin/

clean:
	rm -rf bin
