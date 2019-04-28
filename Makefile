CC = gcc
CFLAGS = -g -Wall

all: cpmdir

cpmdir: cpmdir.o readFlag.o readPhysical.o readLogical.o directoryList.o
	$(CC) $(CFLAGS) -o cpmdir cpmdir.o readFlag.o readPhysical.o readLogical.o directoryList.o

cpmdir.o: cpmdir.c readFlag.h readLogical.h directory.h directoryList.h
	$(CC) $(CFLAGS) -c cpmdir.c

readFlag.o: readFlag.c readFlag.h
	$(CC) $(CFLAGS) -c readFlag.c

readPhysical.o: readPhysical.c readPhysical.h directory.h
	$(CC) $(CFLAGS) -c readPhysical.c

readLogical.o: readLogical.c readLogical.h disk.h directory.h readPhysical.h
	$(CC) $(CFLAGS) -c readLogical.c

directoryList.o: directoryList.c directoryList.h directory.h disk.h
	$(CC) $(CFLAGS) -c directoryList.c

clean:
	rm -f *.o *.exe
