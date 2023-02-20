# Python program to read
# json file
  


"""



"""
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
    print(uniqueFiles)
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
                f.write(element.replace("(", "").replace(")", "").replace("...", "") + "\n")
            
            if flowtype != "dataflow":
                f.write("->\n")
                counter += 1
        if flowtype != "dataflow":        
            f.write("exit\n")
        f.write("}")
        f.close()


if __name__ == "__main__":
    generateGraph()