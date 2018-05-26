#########################################################################
# File Name: update.sh
# Author: Kent Lee
# mail: kent1411390610@gmail.com
# Created Time: Sun May 27 01:45:18 2018
#########################################################################
#!/bin/bash
echo "input commit message pleaz"
read message
git add . 
git commit -m "$message"
git push -u origin master


