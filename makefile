# makefile

program: matrixMain.o
	mpicc -std=c99 matrixMain.o -o matrixMain
	mpirun -n 5 ./matrixMain 5 5

matrixMain.o: matrixMain.c matrixFunctions.h
	mpicc -std=c99 -c matrixMain.c

lab2:lab2.o
	mpicc -std=c99 lab2.o -o main
	mpirun -n 5 ./main

lab2.o: lab2.c
	mpicc -std=c99 -c lab2.c

val:
	valgrind mpirun -n 5 ./main

# test:
# 	time  mpirun -n 5 ./matrixMain 100
# 	time  mpirun -n 5 ./matrixMain 1000
# 	time  mpirun -n 5 ./matrixMain 10000
# 	time   mpirun -n 5 ./matrixMain 20000
# 	time   mpirun -n 5 ./matrixMain 30000
# 	time   mpirun -n 5 ./matrixMain 40000
# 	time   mpirun -n 5 ./matrixMain 50000
# 	time   mpirun -n 5 ./matrixMain 60000

test:
	time  mpirun -n 10 ./matrixMain 100 100
	time  mpirun -n 10 ./matrixMain 1000 1000
	time  mpirun -n 10 ./matrixMain 10000 10000
	time   mpirun -n 10 ./matrixMain 20000 20000
	time   mpirun -n 10 ./matrixMain 30000 30000
	time   mpirun -n 10 ./matrixMain 40000 40000
	# time   mpirun -n 10 ./matrixMain 100000
	# time   mpirun -n 10 ./matrixMain 60000

commitTest:
	git add timing.txt
	git commit -m"send timing"
	git push

clean:
	rm -f *.o
	rm -f main
	rm matrixMain
	clear

