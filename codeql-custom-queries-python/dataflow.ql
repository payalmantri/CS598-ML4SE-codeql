/**
 * @name Empty scope
 * @kind problem
 * @problem.severity warning
 * @id python/example/empty-scope
 */
// import python
// import semmle.python.dataflow.new.DataFlow


// // CLASS DEFINITIONS //

// class UsageVariable extends Variable {
//     string getUsageInfo() {
//         if this.getAnAccess().getAFlowNode().defines(this)
//         then result = "Use "+this.getId() + " " +this.getAUse().getLocation()
//         else
//             if this.getAnAccess().getAFlowNode().uses(this)
//             then result = "Use "+this.getId() + " " +this.getAUse().getLocation()
//             else result = "Store "+this.getId() + " " +this.getAUse().getLocation()
                

//     }

//     string getIsParam() {
//         if this.isParameter() 
//         then result = "Param"
//         else result = "Var"
        
//     }
// }




// class AssignmentVariable extends AssignStmt {
//     string getIsParam() {
//         if this.getAFlowNode().isParameter()
//         then result = "Param"
//         else result = "Var"
//     }
// }


// // QUERIES //

// // from UsageVariable v
// // select v.getAnAccess(), v.getIsParam()+ " " +v.getUsageInfo() + "$"

// // from AssignmentVariable a
// // select a, a.getIsParam()+ " Assign "+ a.getATarget() + " " + a.getLocation() + "$"

// string getQuickLocation(AstNode c) {
//     result = c.getLocation().getFile().getBaseName() + ":" + c.getLocation().getStartLine()
// }

// from Name n
// select n, getQuickLocation(n) 




import python
string getQuickLocation(ControlFlowNode c) {
    result = c.getLocation().getFile().getBaseName() + ":" + c.getLocation().getStartLine()
}

string getDefOrUse(Name n){
    if n.isDefinition()
    then
        result = "Definition"
    else
        if n.isUse() 
        then
            result = "Use"
        else
            result = "Unknown"
}
string formatOutput(ControlFlowNode c, Name n) {
    if (c.getATrueSuccessor() != c.getAFalseSuccessor())
    then result = ""
        + "Node:"+ c.getNode()  + "$"
        + "Variables:"+ n + ":" + getDefOrUse(n) + "$"
        + "Location:" + getQuickLocation(c) + "$"
        + "Type:ConditionalBranch$" 
        + "Predecessor:" + c.getAPredecessor().getNode()  + ":" + getQuickLocation(c.getAPredecessor()) + "$"
        + "TrueSuccessor:" + c.getATrueSuccessor().getNode()  + ":" + getQuickLocation(c.getATrueSuccessor()) + "$"
        + "FalseSuccessor:"+ c.getAFalseSuccessor().getNode()  + ":" + getQuickLocation(c.getAFalseSuccessor()) + "$"
    else
        if c.getANormalSuccessor() != c.getAnExceptionalSuccessor()
        then result = ""
        + "Node:"+ c.getNode()  + "$"
        + "Variables:"+ n + ":" + getDefOrUse(n) + "$"
        + "Location:" + getQuickLocation(c) + "$"
        + "Type:TryCatch$" 
        + "Predecessor:" + c.getAPredecessor().getNode()  + ":" + getQuickLocation(c.getAPredecessor()) + "$"
        + "TrueSuccessor:" + c.getANormalSuccessor().getNode()  + ":" + getQuickLocation(c.getANormalSuccessor()) + "$"
        + "FalseSuccessor:"+ c.getAnExceptionalSuccessor().getNode()  + ":" + getQuickLocation(c.getAnExceptionalSuccessor()) + "$"
        else
            if c instanceof IfExprNode
            then result = ""
            + "Node:"+ c.getNode()  + "$"
            + "Variables:"+ n + ":" + getDefOrUse(n) + "$"
            + "Location:" + getQuickLocation(c) + "$"
            + "Type:Ternary$" 
            + "Predecessor:" + c.getAPredecessor().getNode()  + ":" + getQuickLocation(c.getAPredecessor()) + "$"
            + "TrueSuccessor:" + c.getATrueSuccessor().getNode()  + ":" + getQuickLocation(c.getATrueSuccessor()) + "$"
            + "FalseSuccessor:"+ c.getAFalseSuccessor().getNode()  + ":" + getQuickLocation(c.getAFalseSuccessor()) + "$"    
            else
                if c instanceof ForNode
                then result = ""
                + "Node:"+ c.getNode()  + "$"
                + "Variables:"+ n + ":" + getDefOrUse(n) + "$"
                + "Location:" + getQuickLocation(c) + "$"
                + "Type:ForLoop$" 
                + "Predecessor:" + c.getAPredecessor().getNode()  + ":" + getQuickLocation(c.getAPredecessor()) + "$"
                + "TrueSuccessor:" + c.getATrueSuccessor().getNode()  + ":" + getQuickLocation(c.getATrueSuccessor()) + "$"
                + "FalseSuccessor:"+ c.getAFalseSuccessor().getNode()  + ":" + getQuickLocation(c.getAFalseSuccessor()) + "$"        
                else result = ""
                + "Node:"+ c.getNode()  + "$"
                + "Variables:"+ n + ":" + getDefOrUse(n) + "$"
                + "Location:" + getQuickLocation(c) + "$"
                + "Type:Statement$" 
                + "Predecessor:" + c.getAPredecessor().getNode()  + ":" + getQuickLocation(c.getAPredecessor()) + "$"
                + "Successor:" + c.getANormalSuccessor().getNode()  + ":" + getQuickLocation(c.getANormalSuccessor()) + "$"
                
            
}

// from File fl, ControlFlowNode c, Name n
// where fl.getBaseName() = "train0.py" and c.getLocation().getFile() = fl and n.getLocation() = c.getLocation()//and (c.getANormalSuccessor() != c.getAnExceptionalSuccessor() or c.getATrueSuccessor() != c.getAFalseSuccessor() or c instanceof IfExprNode or c instanceof ForNode)
// select c, formatOutput(c,n)


from File fl, Name def, Name use
where def.getLocation().getFile() = fl 
and use.getLocation().getFile() = fl
and def.isDefinition() and use.isUse()
and def.getLocation().getStartLine() = use.getLocation().getStartLine()
and not def.isConstant()
and not use.isConstant()
select def, use.getId() + "->" + def.getId()




