all:
.SUFFIXES:

-include .fdeps

all:${FDEPS_PROGRAMS}
${FDEPS_PROGRAMS}:
	${FC} ${LDFLAGS} -o $@ $^ ${LDLIBS}

%.o:%.f90
	${FC} ${FFLAGS} -c -o $@ $<
%.o:%.F90
	${FC} ${FFLAGS} -c -o $@ $<
%.mod:
	@true


.fdeps: ${FDEPS_DEPS}
	fdeps -o $@
