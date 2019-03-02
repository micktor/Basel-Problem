OBJECTS = param.o main.o calc_basel.o
.PHONY: clean

basel: $(OBJECTS)
	  gfortran -fdefault-real-8 $(OBJECTS) -o basel

%.o : %.F90
	gfortran -ggdb -O3 -fdefault-real-8 -fdefault-double-8 -ffree-line-length-none -Wuninitialized -c $< 

clean:
	rm -f $(OBJECTS) *.mod basel
