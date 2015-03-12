
# Copyright (c) 2015 Connor Taffe. All rights reserved.

JAVA_INC=-I/usr/lib/jvm/java-openjdk/include -I/usr/lib/jvm/java-openjdk/include/linux

JSRC=test.java
JCLASS=$(JSRC:.java=.class)
JHDR=$(JSRC:.java=.h)

SRC=test.c
OBJ=$(SRC:.c=.o)
LIB=libtest.so

CFLAGS= $(JAVA_INC) -fPIC
LINKFLAGS= -shared

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.h: %.class
	javah -jni $(basename $@)

%.class: %.java
	javac $^

.PHONY: all clean

all: $(LIB) $(JCLASS)

$(LIB): $(OBJ)
	$(CC) $(CCFLAGS) $(LINKFLAGS) -o $@ $^

$(JCLASS): $(JSRC)

$(JHDR): $(JCLASS)

$(OBJ): $(SRC) $(JHDR)

clean:
	$(RM) $(JCLASS) $(JHDR) $(OBJ) $(LIB)
