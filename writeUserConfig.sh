#!/bin/bash

# usage:
#  script user password rnd_usr rnd_password subsys

# file=zowe.config.user.json
config=config/local.json5

# echo $file
# echo '{' > $file
# echo '   "profiles": {' >> $file
# echo '       "zosmf": {' >> $file
# echo '           "type": "zosmf",' >> $file
# echo '           "properties": {' >> $file
# echo '               "user": "'${3}'",' >> $file
# echo '               "password": "'${4}'"' >> $file
# echo '           }' >> $file
# echo '       },' >> $file
# echo '       "base": {' >> $file
# echo '           "type": "base",' >> $file
# echo '           "properties": {' >> $file
# echo '               "user": "'${1}'",' >> $file
# echo '               "password": "'${2}'"' >> $file
# echo '           }' >> $file
# echo '       }' >> $file
# echo '   },' >> $file
# echo '   "secure": []' >> $file
# echo '}' >> $file

echo $config
echo '{' > $config
echo '   "target": "'${1^^}'.TEMP.REXX",' >> $config # upper case
echo '}' >> $config
