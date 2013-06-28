all: img2simg simg2img mkbootimg

img2simg:
	mkdir -p bin
	gcc -g droid-extras/ext4_utils/img2simg.c -o bin/img2simg

simg2img:
	mkdir -p bin
	gcc -g droid-extras/ext4_utils/simg2img.c droid-extras/ext4_utils/sparse_crc32.c -o bin/simg2img

mkbootimg:
	mkdir -p bin
	gcc -I droid-core/include/ -g droid-core/mkbootimg/mkbootimg.c -g droid-core/libmincrypt/sha.c -o bin/mkbootimg

install:
	mkdir -p $(DESTDIR)/usr/bin/
	cp bin/* $(DESTDIR)/usr/bin/

clean:
	rm -rf bin
