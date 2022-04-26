# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)
PARTFILES=$(sort $(wildcard *.scad))
TARGETS=$(patsubst %.scad,%.stl,${PARTFILES})

all: ${TARGETS}

%.stl: %.scad
	openscad -m make -o $@ -d $@.deps $<

clean:
	rm -rf *.stl
	rm -rf *.deps