/**
 * @name Empty block
 * @kind problem
 * @problem.severity warning
 * @id java/example/empty-block
 */


 import java
 string getQuickLocation(ControlFlowNode c) {
     result = c.getLocation().getFile().getBaseName() + ":" + c.getLocation().getStartLine()
 }
 string formatOutput(ControlFlowNode c) {
     if (c instanceof ConditionNode)
     then result = ""
         + "Node:"+ c + ":" + getQuickLocation(c) + "\n"
         + "Type:ConditionalBranch\n" 
         + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
         + "TrueSuccessor:" + ((ConditionNode)c).getATrueSuccessor() + ":" + getQuickLocation(((ConditionNode)c).getATrueSuccessor()) + "\n"
         + "FalseSuccessor:"+ ((ConditionNode)c).getAFalseSuccessor() + ":" + getQuickLocation(((ConditionNode)c).getAFalseSuccessor()) + "\n"
     else
         if (c instanceof TryStmt)
         then result = ""
         + "Node:"+ c + ":" + getQuickLocation(c) + "\n"
         + "Type:TryCatch\n" 
         + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
         + "TrueSuccessor:" + c.getANormalSuccessor() + ":" + getQuickLocation(c.getANormalSuccessor()) + "\n"
         + "FalseSuccessor:"+ c.getAnExceptionSuccessor() + ":" + getQuickLocation(c.getAnExceptionSuccessor()) + "\n"
         else
            if (c instanceof ForStmt)
            then result = ""
            + "Node:"+ c+ ":" + getQuickLocation(c) + "\n"
            + "Type:ForLoop\n" 
            + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
            + "TrueSuccessor:" + c.getANormalSuccessor() + ":" + getQuickLocation(c.getANormalSuccessor()) + "\n"
            //+ "FalseSuccessor:"+ ((ConditionNode)c).getAFalseSuccessor() + ":" + getQuickLocation(((ConditionNode)c).getAFalseSuccessor()) + "\n"        
            else result = ""
            + "Node:"+ c + ":" + getQuickLocation(c) + "\n"
            + "Type:Statement\n" 
            + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
            + "Successor:" + c.getANormalSuccessor() + ":" + getQuickLocation(c.getANormalSuccessor()) + "\n"
                 
             
 }
 
//  from File fl, ControlFlowNode c
//  where fl.getBaseName() = "PlaneSweepCrackerHelper.java" and c.getLocation().getFile() = fl and c.getAPrimaryQlClass().matches("%Stmt") //and c.getNumberOfLinesOfCode() = 1 //and (c.getANormalSuccessor() != c.getAnExceptionalSuccessor() or c.getATrueSuccessor() != c.getAFalseSuccessor() or c instanceof IfExprNode or c instanceof ForNode)
//  select c, getQuickLocation(c) + ":" + c.getAPrimaryQlClass()

//  from File fl, ControlFlowNode c
//  where fl.getBaseName() = "EnvSrlzr.java" and c.getLocation().getFile() = fl//and (c.getANormalSuccessor() != c.getAnExceptionalSuccessor() or c.getATrueSuccessor() != c.getAFalseSuccessor() or c instanceof IfExprNode or c instanceof ForNode)
//  select c, getQuickLocation(c) + ":" + c.getAQlClass()

//  from File fl, ControlFlowNode c
//  where fl.getBaseName() = "EnvSrlzr.java" and c.getLocation().getFile() = fl //and (c.getANormalSuccessor() != c.getAnExceptionalSuccessor() or c.getATrueSuccessor() != c.getAFalseSuccessor() or c instanceof IfExprNode or c instanceof ForNode)
//  select c, formatOutput(c)

from File fl, ControlFlowNode c
where fl.getBaseName() = "PlaneSweepCrackerHelper.java" and c.getLocation().getFile() = fl //and c.getAPrimaryQlClass().matches("%Stmt") //and (c.getANormalSuccessor() != c.getAnExceptionalSuccessor() or c.getATrueSuccessor() != c.getAFalseSuccessor() or c instanceof IfExprNode or c instanceof ForNode)
select c, formatOutput(c)
