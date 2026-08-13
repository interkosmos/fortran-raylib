.POSIX:
.SUFFIXES:

PREFIX  = /usr/local
FC      = gfortran
AR      = ar
RM      = /bin/rm
FORD    = ford
FFLAGS  = -O2 -std=f2018
ARFLAGS = rcs
LDFLAGS = -L/usr/local/lib
RAYLIB  = -lraylib
LDLIBS  = $(RAYLIB) -lglfw -lGL -lpthread -lm
INCDIR  = $(PREFIX)/include/libfortran-raylib
LIBDIR  = $(PREFIX)/lib
TARGET  = libfortran-raylib.a

SRC = src/raylib.F90 \
      src/raylib_camera.f90 \
      src/raylib_math.f90 \
      src/raylib_util.f90
OBJ = raylib.o \
      raylib_camera.o \
      raylib_math.o \
      raylib_util.o

.PHONY: all clean doc examples install

all: $(TARGET)

$(TARGET): $(SRC)
	$(FC) $(FFLAGS) -c src/raylib_util.f90
	$(FC) $(FFLAGS) -c src/raylib.F90
	$(FC) $(FFLAGS) -c src/raylib_camera.f90
	$(FC) $(FFLAGS) -c src/raylib_math.f90
	$(AR) $(ARFLAGS) $(TARGET) $(OBJ)

install: $(TARGET)
	@echo "--- Installing $(TARGET) to $(LIBDIR)/ ..."
	install -d $(LIBDIR)
	install -m 644 $(TARGET) $(LIBDIR)/
	@echo "--- Installing modules to $(INCDIR)/ ..."
	install -d $(INCDIR)
	install -m 644 *.mod $(INCDIR)/

examples: bunny camera camera3d castle collision cubes explosion flags font \
          geometric julia keys log map maze mesh plane shapes ship window

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

mesh: $(TARGET) examples/mesh.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o mesh examples/mesh.f90 $(TARGET) $(LDLIBS)

plane: $(TARGET) examples/plane.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o plane examples/plane.f90 $(TARGET) $(LDLIBS)

shapes: $(TARGET) examples/shapes.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o shapes examples/shapes.f90 $(TARGET) $(LDLIBS)

ship: $(TARGET) examples/ship.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o ship examples/ship.f90 $(TARGET) $(LDLIBS)

window: $(TARGET) examples/window.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -o window examples/window.f90 $(TARGET) $(LDLIBS)

doc: ford.md
	$(FORD) ford.md

clean:
	$(RM) -f *.mod
	$(RM) -f *.o
	$(RM) -f $(TARGET)
	$(RM) -f bunny
	$(RM) -f camera
	$(RM) -f camera3d
	$(RM) -f castle
	$(RM) -f collision
	$(RM) -f cubes
	$(RM) -f explosion
	$(RM) -f flags
	$(RM) -f font
	$(RM) -f geometric
	$(RM) -f julia
	$(RM) -f keys
	$(RM) -f log
	$(RM) -f map
	$(RM) -f maze
	$(RM) -f mesh
	$(RM) -f plane
	$(RM) -f shapes
	$(RM) -f ship
	$(RM) -f window
