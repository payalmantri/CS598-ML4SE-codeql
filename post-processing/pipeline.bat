CD C:\Users\siddh\Documents\Projects\Masters\UIUC\CS598-JBR\Project\CS598-ML4SE-codeql\post-processing

set output_filename=java_dfg
set language=java
set flowtype=dataflow
set query_filename=dataflow.ql

set path_to_outputs=./dataset/%language%/outputs
set output_image_basename=%output_filename%

@REM set databasefile=C:/Users/siddh/AppData/Roaming/Code/User/workspaceStorage/21838071379d818259ce2419150618d2/GitHub.vscode-codeql/java/codeql_db/
set databasefile=C:/Users/siddh/Documents/Projects/Masters/UIUC/CS598-JBR/Project/CS598-ML4SE-codeql/post-processing/dataset/%language%/sample-database/python-database

@REM codeql database analyze %databasefile% --format=csv --output=C:/Users/siddh/Documents/Projects/Masters/UIUC/CS598-JBR/Project/CS598-ML4SE-codeql/post-processing/dataset/%language%/outputs/%output_filename%.csv C:/Users/siddh/Documents/Projects/Masters/UIUC/CS598-JBR/Project/CS598-ML4SE-codeql/codeql-custom-queries-%language%/%query_filename% --rerun


echo %path_to_outputs%/%output_image_basename%


python .\process_data.py %path_to_outputs%/%output_image_basename% %flowtype%


SETLOCAL EnableDelayedExpansion
set i=0
for %%g in (%path_to_outputs%/%output_image_basename%_*.dot) do (

    dot -Tpng %path_to_outputs%/%%g -o %path_to_outputs%/%output_image_basename%_!i!.png
    set /A i+=1
)

