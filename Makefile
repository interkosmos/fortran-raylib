.POSIX:
.SUFFIXES:

FC      = gfortran
AR      = ar
FFLAGS  = -O2 -std=f2018 -Wall -Wno-conversion -fmax-errors=1 -fno-range-check
ARFLAGS = rcs
LDFLAGS = -L/usr/local/lib/ -I./include/
RAYLIB  = -lraylib
LDLIBS  = $(RAYLIB) -lGL -lglfw -lpthread -lm
TARGET  = libfortran-raylib.a

.PHONY: all clean examples

all: $(TARGET)

$(TARGET): src/raylib.f90 src/raylib_util.f90
	$(FC) $(FFLAGS) -c src/raylib.f90
	$(FC) $(FFLAGS) -c src/raylib_camera.f90
	$(FC) $(FFLAGS) -c src/raylib_math.f90
	$(FC) $(FFLAGS) -c src/raylib_util.f90
	$(AR) $(ARFLAGS) $(TARGET) raylib.o raylib_camera.o raylib_math.o raylib_util.o

examples: camera castle cubes flags fly font keys map truck window

camera: $(TARGET) examples/camera.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o camera examples/camera.f90 $(TARGET) $(LDLIBS)

castle: $(TARGET) examples/castle.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o castle examples/castle.f90 $(TARGET) $(LDLIBS)

cubes: $(TARGET) examples/cubes.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o cubes examples/cubes.f90 $(TARGET) $(LDLIBS)

flags: $(TARGET) examples/flags.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o flags examples/flags.f90 $(TARGET) $(LDLIBS)

fly: $(TARGET) examples/fly.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o fly examples/fly.f90 $(TARGET) $(LDLIBS)

font: $(TARGET) examples/font.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o font examples/font.f90 $(TARGET) $(LDLIBS)

keys: $(TARGET) examples/keys.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o keys examples/keys.f90 $(TARGET) $(LDLIBS)

map: $(TARGET) examples/map.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o map examples/map.f90 $(TARGET) $(LDLIBS)

truck: $(TARGET) examples/truck.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o truck examples/truck.f90 $(TARGET) $(LDLIBS)

window: $(TARGET) examples/window.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o window examples/window.f90 $(TARGET) $(LDLIBS)

clean:
	if [ `ls -1 *.mod 2>/dev/null | wc -l` -gt 0 ]; then rm *.mod; fi
	if [ `ls -1 *.o 2>/dev/null | wc -l` -gt 0 ];   then rm *.o; fi
	if [ -e $(TARGET) ]; then rm $(TARGET); fi
	if [ -e camera ]; then rm camera; fi
	if [ -e castle ]; then rm castle; fi
	if [ -e cubes ];  then rm cubes; fi
	if [ -e flags ];  then rm flags; fi
	if [ -e fly ];    then rm fly; fi
	if [ -e keys ];   then rm keys; fi
	if [ -e map ];    then rm map; fi
	if [ -e truck ];  then rm truck; fi
	if [ -e window ]; then rm window; fi
