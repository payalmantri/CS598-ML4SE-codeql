/**
 * @name Empty scope
 * @kind problem
 * @problem.severity warning
 * @id python/example/empty-scope
 */
import python
import semmle.python.dataflow.new.DataFlow


// CLASS DEFINITIONS //

class UsageVariable extends Variable {
    string getUsageInfo() {
        if this.getAnAccess().getAFlowNode().defines(this)
        then result = "Use "+this.getId() + " " +this.getAUse().getLocation()
        else
            if this.getAnAccess().getAFlowNode().uses(this)
            then result = "Use "+this.getId() + " " +this.getAUse().getLocation()
            else result = "Store "+this.getId() + " " +this.getAUse().getLocation()
                

    }

    string getIsParam() {
        if this.isParameter() 
        then result = "Param"
        else result = "Var"
        
    }
}




class AssignmentVariable extends AssignStmt {
    string getIsParam() {
        if this.getAFlowNode().isParameter()
        then result = "Param"
        else result = "Var"
    }
}


// QUERIES //

// from UsageVariable v
// select v.getAnAccess(), v.getIsParam()+ " " +v.getUsageInfo() + "\n"

// from AssignmentVariable a
// select a, a.getIsParam()+ " Assign "+ a.getATarget() + " " + a.getLocation() + "\n"

string getQuickLocation(AstNode c) {
    result = c.getLocation().getFile().getBaseName() + ":" + c.getLocation().getStartLine()
}

from Name n
select n, getQuickLocation(n) 




