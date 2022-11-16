# Create your grading script here
CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"
set -e

rm -rf student-submission
git clone $1 student-submission

cp TestListExamples.java student-submission
cd student-submission


if [[ -e ListExamples.java ]]
then
  echo "ListExamples.java found"
else
  echo "ListExamples.java not found"
  exit 1
fi

if [[ -f ListExamples.java ]] 
then
  echo "ListExamples.java is a file"
else
  echo "ListExamples.java is not a file"
  exit 1
fi

set +e
javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > testout.txt
echo "Report:"

if [[ $? -eq 0 ]]
then 
  grep "OK" testout.txt
  exit 0
else
  grep "Tests run:" testout.txt
  exit 1
fi