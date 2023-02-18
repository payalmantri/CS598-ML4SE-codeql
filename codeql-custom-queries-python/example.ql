/**
 * @name Empty scope
 * @kind problem
 * @problem.severity warning
 * @id python/example/empty-scope
 */

// import python
 
// from Scope s
// where count(s.getAStmt()) = 0
// select s, "This is an empty scope."

import python

// class NodeWithSuccessors extends ControlFlowNode {
//     string getDigraphPointers() {
//         if exists(this.getAnExceptionalSuccessor()) 
//         then
//             result = "Node: " + this.getNode() + " " + this.getNode().getLocation().getStartLine()+":"+this.getNode().getLocation().getEndLine()+ "\n"
//         + "Normal Successor: " + this.getANormalSuccessor().getNode() + " "  + this.getANormalSuccessor().getLocation().getStartLine()+":"+this.getANormalSuccessor().getLocation().getEndLine()+ "\n"
//         + "True Successor: " + this.getATrueSuccessor().getNode() + " " + this.getATrueSuccessor().getLocation().getStartLine()+":"+this.getATrueSuccessor().getLocation().getEndLine()+ "\n"
//         + "False Successor: " + this.getAFalseSuccessor().getNode() + " "  + this.getAFalseSuccessor().getLocation().getStartLine()+":"+this.getAFalseSuccessor().getLocation().getEndLine()+ "\n"
//         + "Error Successor: " + this.getAnExceptionalSuccessor().getNode() + " "  + this.getAnExceptionalSuccessor().getLocation().getStartLine()+":"+this.getAnExceptionalSuccessor().getLocation().getEndLine()+ "\n"
//         else 
//             result = "Node: " + this.getNode() + " " + this.getNode().getLocation().getStartLine()+":"+this.getNode().getLocation().getEndLine()+ "\n"
//         + "Normal Successor: " + this.getANormalSuccessor().getNode() + " "  + this.getANormalSuccessor().getLocation().getStartLine()+":"+this.getANormalSuccessor().getLocation().getEndLine()+ "\n"
//         + "True Successor: " + this.getATrueSuccessor().getNode() + " " + this.getATrueSuccessor().getLocation().getStartLine()+":"+this.getATrueSuccessor().getLocation().getEndLine()+ "\n"
//         + "False Successor: " + this.getAFalseSuccessor().getNode() + " "  + this.getAFalseSuccessor().getLocation().getStartLine()+":"+this.getAFalseSuccessor().getLocation().getEndLine()+ "\n"
        
//     }  
    
// }



// string tryStmtLocationInfo(Stmt s) {
//     result = "Try " + s.getLocation() + "\n"
//             + "Normal Successor: "+s.getAFlowNode().getANormalSuccessor() +" "+s.getAFlowNode().getANormalSuccessor().getLocation() + "\n" 
//             + "Exception Successor: "+s.getAFlowNode().getAnExceptionalSuccessor() +" "+s.getAFlowNode().getAnExceptionalSuccessor().getLocation() + "\n"
            
// }

// string getControlFlowType(Stmt s) {
//     if s instanceof For
//     then result = "Type:For\n"
//     + "First Statement:" + s.getLocation().getFile().getBaseName() + ":" + s.getLocation().getStartLine()+ ":" + s.getLocation().getEndLine() + "\n"
//     // + "Loop Definition: "+s.getASubStatement() +" "+s.getASubStatement().getLocation() + "\n" 
//     + "Last Statement:" + s.getLastStatement().getLocation().getFile().getBaseName() + ":" + s.getLastStatement().getLocation().getStartLine()+ ":" + s.getLastStatement().getLocation().getEndLine() + "\n"
//     else 
//         if s instanceof If
//         then result = "Type:If\n"
//         + "If Statement:" + s.getLocation().getFile().getBaseName() + ":" + s.getLocation().getStartLine()+ ":" + s.getLocation().getEndLine() + "\n"
//         // + "Loop Definition: "+s.getASubStatement() +" "+s.getASubStatement().getLocation() + "\n" 
//         // + "Else-ElseIf Line:" + ((If)s).getAnOrelse().getLocation().getFile().getBaseName() + ":" + ((If)s).getAnOrelse().getLocation().getStartLine()+ ":" + ((If)s).getAnOrelse().getLocation().getEndLine() + "\n"
//         + "Last Line:" + s.getLastStatement().getLocation().getFile().getBaseName() + ":" + s.getLastStatement().getLocation().getStartLine()+ ":" + s.getLastStatement().getLocation().getEndLine() + "\n"
//         else result = "s.getAnEntryNode().toString()"
// }

// class ControlFlowStatement extends Stmt {
// string getControlFlowType(Stmt s) {
//     if s instanceof For
//     then result = "For " + s.getLocation() + "\n"
//     + "True Successor: "+s.getAFlowNode().getATrueSuccessor() +" "+s.getAFlowNode().getATrueSuccessor().getLocation() + "\n" 
//     + "False Successor: "+s.getAFlowNode().getAFalseSuccessor() +" "+s.getAFlowNode().getAFalseSuccessor().getLocation() + "\n"
//     else
//         if s instanceof If
//         then result = "If " + s.getLocation() + "\n"
//         + "True Successor: "+s.getAFlowNode().getATrueSuccessor() +" "+s.getAFlowNode().getATrueSuccessor().getLocation() + "\n" 
//         + "False Successor: "+s.getAFlowNode().getAFalseSuccessor() +" "+s.getAFlowNode().getAFalseSuccessor().getLocation() + "\n"
//         else
//             if s instanceof Try
//             then result = "Try " + s.getLocation() + "\n"
//             + "Normal Successor: "+s.getAFlowNode().getANormalSuccessor() +" "+s.getAFlowNode().getANormalSuccessor().getLocation() + "\n" 
//             + "Exception Successor: "+s.getAFlowNode().getAnExceptionalSuccessor() +" "+s.getAFlowNode().getAnExceptionalSuccessor().getLocation() + "\n"
            
//             else 
//                 if s instanceof While
//                 then result = "While " + s.getLocation() + "\n"
//                 + "True Successor: "+s.getAFlowNode().getATrueSuccessor() +" "+s.getAFlowNode().getATrueSuccessor().getLocation() + "\n" 
//                 + "False Successor: "+s.getAFlowNode().getAFalseSuccessor() +" "+s.getAFlowNode().getAFalseSuccessor().getLocation() + "\n"
//                 else result = s.getAnEntryNode().toString()
// }
// }

// from Function f,  NodeWithSuccessors c
// where  f.getLocation().getFile().getBaseName() = "train2.py" and  exists(f.getBody())
// select c, c.getDigraphPointers()


// from File fl, NodeWithSuccessors c
// where  fl.getBaseName() = "train2.py" and c.getLocation().getFile().getBaseName() = fl.getBaseName()
// select c, c.getDigraphPointers()


// Uncomment the control flow structure you wish to capture.
// For loop information: first statement, last statement
// If statement information: If statement, true successor, false successor
// 

// string branchStmtLocationInfo(Stmt s) {
//     result = "For " + s.getLocation() + "\n"
//     + "True Successor: "+s.getAnEntryNode().getATrueSuccessor() +" "+s.getAnEntryNode().getATrueSuccessor().getLocation() + "\n" 
//     + "False Successor: "+s.getAnEntryNode().getAFalseSuccessor() +" "+s.getAnEntryNode().getAFalseSuccessor().getLocation() + "\n"
    
// }

// from Function f, For s
// where exists(f.getBody())
// select s, "For " + s.getASubStatement().getLocation() + " " + s.getLastStatement().getLocation()

// from Function f, If s
// where exists(f.getBody())
// select s, branchStmtLocationInfo(s)

// from Function f, Try s
// where exists(f.getBody())
// select s, branchStmtLocationInfo(s)

// from Function f, While s
// where exists(f.getBody())
// select s, branchStmtLocationInfo(s)


//
//For testing on func in one file
// from File fl, Stmt s
// where fl.getBaseName() = "train0.py" and (s instanceof For or s instanceof If) and s.getLocation().getFile() = fl
// select s, getControlFlowType(s)

import python
string getQuickLocation(ControlFlowNode c) {
    result = c.getLocation().getFile().getBaseName() + ":" + c.getLocation().getStartLine()
}
string formatOutput(ControlFlowNode c) {
    if (c.getATrueSuccessor() != c.getAFalseSuccessor())
    then result = ""
        + "Node:"+ c + ":" + getQuickLocation(c) + "\n"
        + "Type:ConditionalBranch\n" 
        + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
        + "TrueSuccessor:" + c.getATrueSuccessor() + ":" + getQuickLocation(c.getATrueSuccessor()) + "\n"
        + "FalseSuccessor:"+ c.getAFalseSuccessor() + ":" + getQuickLocation(c.getAFalseSuccessor()) + "\n"
    else
        if c.getANormalSuccessor() != c.getAnExceptionalSuccessor()
        then result = ""
        + "Node:"+ c + ":" + getQuickLocation(c) + "\n"
        + "Type:TryCatch\n" 
        + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
        + "TrueSuccessor:" + c.getANormalSuccessor() + ":" + getQuickLocation(c.getANormalSuccessor()) + "\n"
        + "FalseSuccessor:"+ c.getAnExceptionalSuccessor() + ":" + getQuickLocation(c.getAnExceptionalSuccessor()) + "\n"
        else
            if c instanceof IfExprNode
            then result = ""
            + "Node:"+ c + ":" + getQuickLocation(c) + "\n"
            + "Type:Ternary\n" 
            + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
            + "TrueSuccessor:" + c.getATrueSuccessor() + ":" + getQuickLocation(c.getATrueSuccessor()) + "\n"
            + "FalseSuccessor:"+ c.getAFalseSuccessor() + ":" + getQuickLocation(c.getAFalseSuccessor()) + "\n"    
            else
                if c instanceof ForNode
                then result = ""
                + "Node:"+ c+ ":" + getQuickLocation(c) + "\n"
                + "Type:ForLoop\n" 
                + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
                + "TrueSuccessor:" + c.getATrueSuccessor() + ":" + getQuickLocation(c.getATrueSuccessor()) + "\n"
                + "FalseSuccessor:"+ c.getAFalseSuccessor() + ":" + getQuickLocation(c.getAFalseSuccessor()) + "\n"        
                else result = ""
                + "Node:"+ c + ":" + getQuickLocation(c) + "\n"
                + "Type:Statement\n" 
                + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
                + "Successor:" + c.getANormalSuccessor() + ":" + getQuickLocation(c.getANormalSuccessor()) + "\n"
                
            
}

from File fl, ControlFlowNode c
where fl.getBaseName() = "train0.py" and c.getLocation().getFile() = fl //and (c.getANormalSuccessor() != c.getAnExceptionalSuccessor() or c.getATrueSuccessor() != c.getAFalseSuccessor() or c instanceof IfExprNode or c instanceof ForNode)
select c, formatOutput(c)


// from Method f,  NodeWithSuccessors c
// where exists(f.getBody())
// select c, c.getDigraphPointers()
//"control flow node: " + c.getNode() + " " +c.getNode().getLocation().getFile() + ":" + c.getNode().getLocation().getStartLine()+ "\n control flow node successor: "+ c.getANormalSuccessor().getNode() + " " +c.getANormalSuccessor().getNode().getLocation() + "\n control flow node true successor: "+ c.getATrueSuccessor().getNode()+ " " +c.getATrueSuccessor().getNode().getLocation()+"\n control flow node false successor: " + c.getAFalseSuccessor().getNode() + " " +c.getAFalseSuccessor().getNode().getLocation()
// select c, "control flow node"