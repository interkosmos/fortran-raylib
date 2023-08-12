.POSIX:
.SUFFIXES:

FC      = gfortran
AR      = ar
FFLAGS  = -std=f2018 -Wall -Wno-conversion -fmax-errors=1 -fno-range-check
ARFLAGS = rcs
LDFLAGS = -L/usr/local/lib -I/usr/local/include
LDLIBS  = -lraylib -lGL -lpthread -lm
TARGET  = libfortran-raylib.a

.PHONY: all clean examples

all: $(TARGET)

$(TARGET): src/raylib.f90
	$(FC) $(FFLAGS) -c src/raylib.f90
	$(FC) $(FFLAGS) -c src/raylib_util.f90
	$(AR) $(ARFLAGS) $(TARGET) raylib.o raylib_util.o

examples: $(TARGET)
	$(FC) $(FFLAGS) $(LDFLAGS) -o camera examples/camera.f90 $(TARGET) $(LDLIBS)
	$(FC) $(FFLAGS) $(LDFLAGS) -o flags  examples/flags.f90  $(TARGET) $(LDLIBS)
	$(FC) $(FFLAGS) $(LDFLAGS) -o keys   examples/keys.f90   $(TARGET) $(LDLIBS)
	$(FC) $(FFLAGS) $(LDFLAGS) -o window examples/window.f90 $(TARGET) $(LDLIBS)

clean:
	if [ `ls -1 *.mod 2>/dev/null | wc -l` -gt 0 ]; then rm *.mod; fi
	if [ `ls -1 *.o 2>/dev/null | wc -l` -gt 0 ];   then rm *.o;   fi
	if [ -e $(TARGET) ]; then rm $(TARGET); fi
	if [ -e camera ]; then rm camera; fi
	if [ -e flags ];  then rm flags; fi
	if [ -e keys ];   then rm keys; fi
	if [ -e window ]; then rm window; fi
