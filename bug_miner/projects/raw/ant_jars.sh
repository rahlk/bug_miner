#! /bin/bash
export JAVA_HOME=`/usr/libexec/java_home`
cat ant_tags.csv| while read line
  do
    hash=$(echo $line | cut -f3 -d' ')
    version=$(echo $line | cut -f4 -d' ')

    # Go to project directory
    cd ant
    git checkout -f $hash
    sh build.sh
    find build -name '*.class' -print | java -jar ~/ckjm/target/runable-ckjm_ext-2.3-SNAPSHOT.jar -x 
    cd ..
  done
