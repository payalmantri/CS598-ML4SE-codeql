`codeql database analyze C:/Users/siddh/Documents/Projects/Masters/UIUC/CS598-JBR/Project/CS598-ML4SE-codeql/post-processing/dataset/python/sample-database/python-database --format=csv --output=C:/Users/siddh/Documents/Projects/Masters/UIUC/CS598-JBR/Project/CS598-ML4SE-codeql/post-processing/dataset/python/outputs/python-controlflow.csv C:/Users/siddh/Documents/Projects/Masters/UIUC/CS598-JBR/Project/CS598-ML4SE-codeql/codeql-custom-queries-python/example.ql --rerun`


`dot -Tpng path/to/test-graphviz.dot -o path/to/output2.png`
`dot -Tpng test-graphviz.dot -o output2.png`


-------
`codeql database analyze ~/Library/Application\ Support/Code/User/workspaceStorage/380c0d1e50a1a918cf34b378d168cc23/GitHub.vscode-codeql/java/codeql_db/ --format=csv --output=results.csv  /Users/payalmantri/Desktop/practice/CS598/CS598-ML4SE-codeql/codeql-custom-queries-java/example.ql --rerun`

python post-processing/process_data.py post-processing/dataset/java/outputs/results1 control-flow

dot -Tpng post-processing/dataset/java/outputs/results1_0.dot -o post-processing/dataset/java/outputs/output1.png 
