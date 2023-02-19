# Python program to read
# json file
  
"""
Code to process the codesearchnet json training data and put it into separate python files
"""
# import json
  
# # Opening JSON file
# f = open('dataset/python/python20.json')
  
# # returns JSON object as 
# # a dictionary
# data = json.load(f)
  
# # Iterating through the json
# # list
# for ix,rec in enumerate(data):
#     fh = open("dataset/python/sample-database/train"+str(ix)+".py", "a", encoding="utf-8")
#     print(rec["original_string"])
#     fh.write(rec["original_string"])
#     fh.close()
  
# # Closing file
# f.close()


# from staticfg import CFGBuilder

# cfg = CFGBuilder().build_from_file('quick sort', 'dataset/python/train0.py')
# cfg.build_visual('train0', 'png')


import pandas as pd
import sys

def generateGraph():
    if len(sys.argv) < 3:
        raise Exception("Please provide a base filename for output")
    op_filename = sys.argv[1]
    flowtype = sys.argv[2]
    graphData = pd.read_csv(f'{op_filename}.csv', names=["Scope","Warning", "Edges","File", "StartLine", "StartCol", "EndLine", "EndCol"])
    print(graphData.head())
    uniqueFiles = graphData["File"].unique()
    for jx,filename in enumerate(uniqueFiles):
        f = open(f"{op_filename}_{jx}.dot", "w")
        f.write("strict digraph {")
        counter = 0
        allEdges = graphData.loc[lambda df: df["File"] == filename,"Edges"]
        for ix,element in allEdges.items():
            if "\n" in element and flowtype != "dataflow":
                parts = element.split("\n")
                for el in parts:
                    f.write(el.replace("(", "").replace(")", "") + "\n")
                    f.write(f"-> \"{counter}\"\n")
            else:
                f.write(element.replace("(", "").replace(")", "") + "\n")
            
            if flowtype != "dataflow":
                f.write("->\n")
                counter += 1
        if flowtype != "dataflow":        
            f.write("exit\n")
        f.write("}")
        f.close()


if __name__ == "__main__":
    generateGraph()