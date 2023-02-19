CD C:\Users\siddh\Documents\Projects\Masters\UIUC\CS598-JBR\Project\CS598-ML4SE-codeql\post-processing

set output_filename=python_dfg
set query_filename=dataflow.ql
set path_to_outputs=./dataset/python/outputs
set output_image_basename=%output_filename%
set flowtype=dataflow


codeql database analyze C:/Users/siddh/Documents/Projects/Masters/UIUC/CS598-JBR/Project/CS598-ML4SE-codeql/post-processing/dataset/python/sample-database/python-database --format=csv --output=C:/Users/siddh/Documents/Projects/Masters/UIUC/CS598-JBR/Project/CS598-ML4SE-codeql/post-processing/dataset/python/outputs/%output_filename%.csv C:/Users/siddh/Documents/Projects/Masters/UIUC/CS598-JBR/Project/CS598-ML4SE-codeql/codeql-custom-queries-python/%query_filename% --rerun


echo %path_to_outputs%/%output_image_basename%
python .\process_data.py %path_to_outputs%/%output_image_basename% %flowtype%
SETLOCAL EnableDelayedExpansion
set i=0

for %%g in (%path_to_outputs%/%output_image_basename%_*.dot) do (

    dot -Tpng %path_to_outputs%/%%g -o %path_to_outputs%/%output_image_basename%_!i!.png
    set /A i+=1
)

