#!/bin/bash

DB_LIST="
MEDBETA:/u01/app/oracle/product/11.2.0.4/db_1
KDHBETA:/u02/app/oracle/product/12.2.0.1/db_1
SIGMA:/u03/app/oracle/product/19.3.0/db_home
"

for DB in $DB_LIST
do
    ORACLE_SID=`echo $DB | cut -d: -f1`
    ORACLE_HOME=`echo $DB | cut -d: -f2`

    export ORACLE_SID
    export ORACLE_HOME
    export PATH=$ORACLE_HOME/bin:$PATH

    echo "Starting Database : $ORACLE_SID"

    $ORACLE_HOME/bin/sqlplus -s / as sysdba <<EOF
startup;
exit;
EOF

done

echo "All databases started."