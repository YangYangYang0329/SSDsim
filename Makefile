# ssdsim linux support
.PHONY : all clean rebuild r

all: ssd
	
clean:
	rm -f ssd *.o *~
.PHONY: clean

ssd: ssd.o  flash.o  pagemap.o  avlTree.o   initialize.o
	gcc  -D_FILE_OFFSET_BITS=64 -g -lm -o ssd ssd.o  flash.o initialize.o pagemap.o avlTree.o -lm
%.o: %.c
	gcc -c -D_FILE_OFFSET_BITS=64  -g -lm $^ -o $@


rebuild : clean all

r : clean all
