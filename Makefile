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

examples: bunny camera camera3d castle collision cubes explosion flags font geometric julia keys \
          log map maze plane shapes truck window

bunny: $(TARGET) examples/bunny.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o bunny examples/bunny.f90 $(TARGET) $(LDLIBS)

camera: $(TARGET) examples/camera.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o camera examples/camera.f90 $(TARGET) $(LDLIBS)

camera3d: $(TARGET) examples/camera3d.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o camera3d examples/camera3d.f90 $(TARGET) $(LDLIBS)

castle: $(TARGET) examples/castle.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o castle examples/castle.f90 $(TARGET) $(LDLIBS)

collision: $(TARGET) examples/collision.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o collision examples/collision.f90 $(TARGET) $(LDLIBS)

cubes: $(TARGET) examples/cubes.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o cubes examples/cubes.f90 $(TARGET) $(LDLIBS)

explosion: $(TARGET) examples/explosion.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o explosion examples/explosion.f90 $(TARGET) $(LDLIBS)

flags: $(TARGET) examples/flags.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o flags examples/flags.f90 $(TARGET) $(LDLIBS)

font: $(TARGET) examples/font.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o font examples/font.f90 $(TARGET) $(LDLIBS)

geometric: $(TARGET) examples/geometric.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o geometric examples/geometric.f90 $(TARGET) $(LDLIBS)

julia: $(TARGET) examples/julia.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o julia examples/julia.f90 $(TARGET) $(LDLIBS)

keys: $(TARGET) examples/keys.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o keys examples/keys.f90 $(TARGET) $(LDLIBS)

log: $(TARGET) examples/log.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o log examples/log.f90 $(TARGET) $(LDLIBS)

map: $(TARGET) examples/map.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o map examples/map.f90 $(TARGET) $(LDLIBS)

maze: $(TARGET) examples/maze.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o maze examples/maze.f90 $(TARGET) $(LDLIBS)

plane: $(TARGET) examples/plane.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o plane examples/plane.f90 $(TARGET) $(LDLIBS)

shapes: $(TARGET) examples/shapes.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o shapes examples/shapes.f90 $(TARGET) $(LDLIBS)

truck: $(TARGET) examples/truck.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o truck examples/truck.f90 $(TARGET) $(LDLIBS)

window: $(TARGET) examples/window.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o window examples/window.f90 $(TARGET) $(LDLIBS)

clean:
	if [ `ls -1 *.mod 2>/dev/null | wc -l` -gt 0 ]; then rm *.mod; fi
	if [ `ls -1 *.o 2>/dev/null | wc -l` -gt 0 ]; then rm *.o; fi
	if [ -e $(TARGET) ]; then rm $(TARGET); fi
	if [ -e bunny ]; then rm bunny; fi
	if [ -e camera ]; then rm camera; fi
	if [ -e camera3d ]; then rm camera3d; fi
	if [ -e castle ]; then rm castle; fi
	if [ -e collision ]; then rm collision; fi
	if [ -e cubes ]; then rm cubes; fi
	if [ -e explosion ]; then rm explosion; fi
	if [ -e flags ]; then rm flags; fi
	if [ -e font ]; then rm font; fi
	if [ -e geometric ]; then rm geometric; fi
	if [ -e julia ]; then rm julia; fi
	if [ -e keys ]; then rm keys; fi
	if [ -e log ]; then rm log; fi
	if [ -e map ]; then rm map; fi
	if [ -e maze ]; then rm maze; fi
	if [ -e plane ]; then rm plane; fi
	if [ -e shapes ]; then rm shapes; fi
	if [ -e truck ]; then rm truck; fi
	if [ -e window ]; then rm window; fi
