CS 598 JBR Project

# File Structure

codeql-custom-queries-python/
    -> dataflow.ql #Analyze data flow in python
    -> example.ql #Analyze control flow in python
codeql-custom-queries-java/
    -> dataflow.ql #Analyze data flow in java
    -> example.ql #Analyze control flow in java
post-processing/ 
    -> dataset/ 
        -> java/
            -> outputs/ #contains the output csv, the .dot files and the images of the control flow and dataflow that were analyzed
        -> python
            -> outputs/ #contains the output csv, the .dot files and the images of the control flow and dataflow that were analyzed
            -> sample-database/ #Contains the extracted python files that are analyzed, and the codeql database files
            -> python20.json #The code snippets from the code search net records in json format
    -> process_data.py # convert the data from the output csv to a graphviz .dot file
    -> import_samples.py #read the code snippets from the CodeSearchNet records from json to make python files for a local db
    -> usefulCommands.md #Contains some commands related to running the codeql queries and generating the graphs in the terminal
    -> pipeline.bat #run the full data query to graph image generation pipeling

# Setup and Execution

## Manual Execution
1. clone this repository
2. create the python database by modifying the commands in the usefulCommands file under the "Creating a python local db" section and running them in the terminal
3. Add the "https://github.com/Esri/geometry-api-java/" using the codeql extension in vs code
4. modify and use the commands in the usefulCommands file under the "Running the codeql command to run a query file and output to an csv" section to generate the csv for either the control flow or dataflow for python or java
5. modify and use the commands in the usefulCommands file under the "run the python post processing script to generate the graphviz files" section to generate the .dot files for the csv you generated in step (3)
6. modify and use the commands in the usefulCommands file under the "generating the image file from the dot file" section to create the image output

## Automated Pipeline
1. clone this repository
2. create the python database by modifying the commands in the usefulCommands file under the "Creating a python local db" section and running them in the terminal
3. Add the "https://github.com/Esri/geometry-api-java/" using the codeql extension in vs code
4. Run the ./pipeline.bat file by navigating to the post-processing folder

# Outputs
Find the image and csv outputs of the control flow or data flow graph in the outputs/ folder under the language specific folders {java or python}