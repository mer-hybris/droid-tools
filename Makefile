all: img2simg simg2img mkbootimg make_ext4fs

img2simg:
	mkdir -p bin
	gcc -g droid-extras/ext4_utils/img2simg.c -o bin/img2simg

make_ext4fs:
	mkdir -p bin
	gcc -g -DANDROID -I droid-core/include droid-extras/ext4_utils/make_ext4fs_main.c \
        droid-extras/ext4_utils/make_ext4fs.c \
        droid-extras/ext4_utils/ext4fixup.c \
        droid-extras/ext4_utils/ext4_utils.c \
        droid-extras/ext4_utils/allocate.c \
        droid-extras/ext4_utils/backed_block.c \
        droid-extras/ext4_utils/output_file.c \
        droid-extras/ext4_utils/contents.c \
        droid-extras/ext4_utils/extent.c \
        droid-extras/ext4_utils/indirect.c \
        droid-extras/ext4_utils/uuid.c \
        droid-extras/ext4_utils/sha1.c \
        droid-extras/ext4_utils/sparse_crc32.c \
        droid-extras/ext4_utils/wipe.c -lz -o bin/make_ext4fs

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
