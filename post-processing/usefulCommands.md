# Running the codeql command to run a query file and output to an csv
`codeql database analyze C:/Users/siddh/AppData/Roaming/Code/User/workspaceStorage/21838071379d818259ce2419150618d2/GitHub.vscode-codeql/java/codeql_db/ --format=csv --output=C:/Users/siddh/Documents/Projects/Masters/UIUC/CS598-JBR/Project/CS598-ML4SE-codeql/post-processing/dataset/java/outputs/java-dataflow.csv C:/Users/siddh/Documents/Projects/Masters/UIUC/CS598-JBR/Project/CS598-ML4SE-codeql/codeql-custom-queries-java/dataflow.ql --rerun`

`codeql database analyze ~/Library/Application\ Support/Code/User/workspaceStorage/380c0d1e50a1a918cf34b378d168cc23/GitHub.vscode-codeql/java/codeql_db/ --format=csv --output=results.csv  /Users/payalmantri/Desktop/practice/CS598/CS598-ML4SE-codeql/codeql-custom-queries-java/example.ql --rerun`

`codeql database analyze ~/Library/Application\ Support/Code/User/workspaceStorage/380c0d1e50a1a918cf34b378d168cc23/GitHub.vscode-codeql/java/codeql_db/ --format=csv --output=results.csv  /Users/payalmantri/Desktop/practice/CS598/CS598-ML4SE-codeql/codeql-custom-queries-java/example.ql --rerun`

# Creating the python local db
`cd C:\Users\siddh\Documents\Projects\Masters\UIUC\CS598-JBR\Project\CS598-ML4SE-codeql\post-processing\dataset\python\sample-database`
`codeql database create --language=python ./python-database`

# run the python post processing script to generate the graphviz files
`python post-processing/process_data.py post-processing/dataset/java/outputs/results1 controlflow`

# generating the image file from the dot file
`dot -Tpng post-processing/dataset/java/outputs/results1_0.dot -o post-processing/dataset/java/outputs/output1.png` 
## Examples:
`dot -Tpng path/to/test-graphviz.dot -o path/to/output2.png`
`dot -Tpng test-graphviz.dot -o output2.png`

