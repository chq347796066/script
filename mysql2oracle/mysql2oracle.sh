#!/bin/bash
tempPath=/opt/software/datax/tempfile/
tables=(XCX_BUTLER_REMINDER XCX_BUTLER_REMINDER_DETAIL XCX_BUTLER_REMINDER_WAY XCX_PAY_DETAILS XCX_PAY_RECORD)
tableName=${tables[0]}
python /opt/software/datax/bin/datax.py  -p "-DtableName=${tableName}" /opt/software/datax/job/id2file.json
chmod 777 ${tempPath}
exec /opt/software/datax/job/execute.sh ${tableName}
