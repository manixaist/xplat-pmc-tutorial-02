SHELL = /bin/sh
.SUFFIXES:
.SUFFIXES: .cpp .o

EXE_NAME = xplat-pmc-tutorial-01.exe

# Add additional .cpp/.o pairs to the MODULES List (e.g. main input graphics ...)
MODULES := main
# Generates a list of the modules with ".o" appended
OBJS := $(MODULES).o

# external libraries.
# remember ordering is important to the linker...
LIBS := \
	-lSDL2

REBUILDABLES := $(OBJS) $(EXE_NAME)

# All warning, debug output, C++11, x64
# later we can tease out the debug
CXXFLAGS += -Wall -g -std=c++11 -m64

# list of external paths
INCLUDE_PATHS := \
	/usr/include/SDL2 

# Expands each include path above to -I/path/1 -I/path/2 ... etc
INCLUDES := -I$(INCLUDE_PATHS)

all : $(EXE_NAME)
	echo All done

# This is the linking rule, it creates the exe from the list of dependent objects
$(EXE_NAME) : $(OBJS)
	g++ -g -o $@ $^ $(LIBS)

# Compilation rule, it matches the object's corresponding .cpp file
%.o : %.cpp
	g++ -o $@ -c $(CXXFLAGS) $(INCLUDES) $<

.PHONY : clean
clean : 
	rm -f $(REBUILDABLES)
	echo Clean done
