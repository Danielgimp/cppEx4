#!make -f

CXX=clang++-9 
CXXFLAGS=-std=c++2a

HEADERS := $(wildcard *.h*)
TEACHER_SOURCES := Demo.cpp TestCounter.cpp Test.cpp
STUDENT_SOURCES := $(filter-out $(TEACHER_SOURCES), $(wildcard *.cpp))
STUDENT_OBJECTS := $(subst .cpp,.o,$(STUDENT_SOURCES))

run: test
	./$^

test: Test_amichai.o Test_oriane_yirat.o TestRunner.o $(STUDENT_OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o test

%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) --compile $< -o $@

clean:
	rm -f *.o demo test
