#!/bin/bash

# output the debug config of intellij for a certain Cover version and copy it to clipboard
function debugj { 
echo "-ea -javaagent:/Users/mariusolariu/code/cover/cover-cli/target/launcher-$1-SNAPSHOT-shared-jar.jar -Dcom.diffblue.springIsolationJar=/Users/mariusolariu/code/cover/cover-cli/target/cover-isolation-layer-$1-SNAPSHOT.jar" | pbcopy
 }

 function arrangeScreens {
   # places the screens in the positon that I like
	 displayplacer "id:63165A8F-CC0B-969B-C8BB-80329CC25E84 res:1920x1080 hz:60 color_depth:8 scaling:off origin:(0,0) degree:0" "id:1FF8F5E7-4684-FAAF-396B-715F8AE0AA7F res:1680x1050 color_depth:4 scaling:on origin:(780,1080) degree:0" "id:8E275E9C-A628-A9DD-F228-10D45297F74E res:1080x1920 hz:60 color_depth:8 scaling:off origin:(1920,-840) degree:270"
 }

function gclean {
  git clean -f && git clean -fd
}

 # run IT test
 function runIT {
   mvn verify -Dit.test="$1" -DfailIfNoTests=false -pl "$2"  -Dtest=none -Dinvoker.skip=true
 }

 # show test
 function st {
   cat $(find . -name "$1DiffblueTest.java")
 }

 function gc-- {
   git checkout -- $1
 }

 function gclo {
   git clone  $1
 }

 function gbdr {
   git push origin -d $1
 }

 function grd {
   echo "Rebasing  on develop"
   git fetch origin
   echo "Fetched from origin\n"
   git rebase develop
 }

 function grid {
   echo "Rebasing interactively on develop"
   git fetch origin
   echo "Fetched from origin\n"
   git rebase -i develop $1
 }

 function gbdlr {
   YELLOW='\033[0;33m'
   NC='\033[0m'

   git branch -D $1
   if [ "$?" == "0" ]; then
     echo -e "${YELLOW} Deleted local branch ${NC}"
   fi

   git push origin -d $1
   if [ "$?" == "0" ]; then
     echo -e "${YELLOW} Deleted remote branch ${NC}"
   fi

 }
