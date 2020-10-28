#!/bin/bash

# SPDX-License-Identifier: Apache-2.0


#support for OS
case $OSTYPE in
darwin*) psql postgres -v dbname=$DATABASE_DATABASE -v user=$DATABASE_USERNAME -v passwd=$DATABASE_PASSWD -f ./explorerpg.sql ;
psql postgres -v dbname=$DATABASE_DATABASE -v user=$DATABASE_USERNAME -v passwd=$DATABASE_PASSWD -f ./updatepg.sql ;;
linux*)
if [ $(id -un) = 'postgres' ]; then
  PSQL="psql"
else
  PSQL="sudo -u postgres psql"
fi;
${PSQL} -v dbname=$DATABASE_DATABASE -v user=$DATABASE_USERNAME -v passwd=$DATABASE_PASSWD -f ./explorerpg.sql ;
${PSQL} -v dbname=$DATABASE_DATABASE -v user=$DATABASE_USERNAME -v passwd=$DATABASE_PASSWD -f ./updatepg.sql ;;
esac


