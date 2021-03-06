TARGET	= libmatmult.so
LIBSRCS	= matmult.c
LIBOBJS	= matmult.o

OPT	= -g -Ofast -march=native -fno-trapping-math -funroll-loops
PIC	= -fPIC

CC	= gcc
CFLAGS= $(OPT) $(PIC) $(XOPTS)

SOFLAGS = -shared 
XLIBS	= -L/usr/lib64/atlas -lsatlas

$(TARGET): $(LIBOBJS)
	$(CC) $(CFLAGS) -o $@ $(SOFLAGS) $(LIBOBJS) $(XLIBS)

clean:
	@/bin/rm -f core core.* $(LIBOBJS) 
