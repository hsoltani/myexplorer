#!/bin/bash

# SPDX-License-Identifier: Apache-2.0


#support for OS
case $OSTYPE in
darwin*) psql postgres -d fabricexplorer -U hppoc -f ./explorerpg.sql ;
psql postgres -d fabricexplorer -U hppoc -f ./updatepg.sql ;;
linux*)
if [ $(id -un) = 'postgres' ]; then
  PSQL="psql"
else
  PSQL="sudo -u postgres psql"
fi;
${PSQL} -d fabricexplorer -U hppoc -f ./explorerpg.sql ;
${PSQL} -d fabricexplorer -U hppoc -f ./updatepg.sql ;;
esac


