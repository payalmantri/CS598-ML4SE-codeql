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


string formatParentChild(ControlFlowNode n, string ty){
   ty = "If" and
   result = ""
   + "\"" + n.getEnclosingStmt() + " " + getQuickLocation(n) + "\"" + " -> " + "\"" +((IfStmt)n).getThen().getControlFlowNode()+ " " + getQuickLocation(((IfStmt)n).getThen().getControlFlowNode()) + "\"" + "\n"
   + "\"" + n.getEnclosingStmt() + " " + getQuickLocation(n) + "\"" + " -> " + "\"" + ((IfStmt)n).getElse().getControlFlowNode()+ " " + getQuickLocation(((IfStmt)n).getElse().getControlFlowNode()) + "\""
   or
   ty = "For" and
   result = ""
   + "\"" + n + " " + getQuickLocation(n) + "\"" + " -> " + "\"" + ((ConditionNode)((ForStmt)n).getCondition()).getATrueSuccessor()+ " " + getQuickLocation(((ConditionNode)((ForStmt)n).getCondition()).getATrueSuccessor()) + "\"" + "\n"
   + "\"" + n + " " + getQuickLocation(n) + "\"" + " -> " +  "\"" + ((ConditionNode)((ForStmt)n).getCondition()).getAFalseSuccessor()+ " " + getQuickLocation(((ConditionNode)((ForStmt)n).getCondition()).getAFalseSuccessor()) + "\""
   or 
   ty = "TryCatch" and
   result = ""
   + "\"" + n + " " + getQuickLocation(n) + "\"" + " -> " + "\"" + n.getANormalSuccessor()+ " " + getQuickLocation(n.getANormalSuccessor()) + "\"" + "\n"
   + "\"" + n + " " + getQuickLocation(n) + "\"" + " -> " + "\"" +((TryStmt)n).getControlFlowNode().getAnExceptionSuccessor()+ " " + getQuickLocation(((TryStmt)n).getControlFlowNode().getAnExceptionSuccessor()) + "\""
   or
   ty = "Stmt" and
   result = ""
   + "\"" + n.getEnclosingStmt() + " " + getQuickLocation(n) + "\"" + " -> " + "\"" + n.getANormalSuccessor()+ " " + getQuickLocation(n.getANormalSuccessor()) + "\""
           

}

string formatOutput1(ControlFlowNode c) {
   if (c instanceof IfStmt )
   then result = formatParentChild(c, "If")
   else
       if c instanceof TryStmt
       then result = formatParentChild(c, "TryCatch")
      //  else
         //   if c instanceof IfExprNode
         //   then result = formatParentChild(c, "If")   
           else
               if c instanceof ForStmt
               then result = formatParentChild(c, "For")        
               else result = formatParentChild(c, "Stmt")
               
           
}

string formatOutput(ControlFlowNode c) {
     if (c instanceof IfStmt)
     then 
        result = ""
        //  + getDigraphFormat(c, ((IfStmt)c).getThen().getControlFlowNode())+"\n"
        //  + getDigraphFormat(c, ((IfStmt)c).getElse().getControlFlowNode())+"\n"

         + "Node:"+ c + ":" + getQuickLocation(c) + "\n"
         + "Type: ConditionalBranch\n" 
         + "Predecessor:" + c.getAPredecessor()+ ":" + getQuickLocation(c.getAPredecessor()) + "\n"
         + "TrueSuccessor:" + ((IfStmt)c).getThen().getControlFlowNode() +   ":" + getQuickLocation(((IfStmt)c).getThen().getControlFlowNode())+ "\n" 
            // check if there is an else branch
        
            + "FalseSuccessor:" + ((IfStmt)c).getElse().getControlFlowNode() + ":" + getQuickLocation(((IfStmt)c).getElse().getControlFlowNode()) + "\n"
    else
         if (c instanceof TryStmt)
         then result = ""
            // + getDigraphFormat(c, c.getANormalSuccessor())+"\n"
            // + getDigraphFormat(c, ((TryStmt)c).getACatchClause().getControlFlowNode())+"\n"
         + "Node:"+ c + ":" + getQuickLocation(c) + "\n"
         + "Type: TryCatch\n" 
         + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
         + "TrueSuccessor:" + c.getANormalSuccessor()+ ":" + getQuickLocation(c.getANormalSuccessor()) + "\n"
         + "FalseSuccessor:"+ ((TryStmt)c).getACatchClause().getControlFlowNode() + ":" + getQuickLocation(((TryStmt)c).getACatchClause().getControlFlowNode()) + "\n"
         else
            if (c instanceof ForStmt)
            then result = ""
            // + getDigraphFormat(c, c.getANormalSuccessor())+"\n"
            // + getDigraphFormat(c, ((ConditionNode)(((ForStmt)c).getCondition())).getAFalseSuccessor())+"\n"
            + "Node:"+ c+ ":" + getQuickLocation(c) + "\n"
            + "Type:ForLoop\n" 
            + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
            + "TrueSuccessor:" + c.getANormalSuccessor() + ":" + getQuickLocation(c.getANormalSuccessor()) + "\n"
           + "FalseSuccessor:"+ ((ConditionNode)(((ForStmt)c).getCondition())).getAFalseSuccessor() + ":" + getQuickLocation(((ConditionNode)(((ForStmt)c).getCondition().getControlFlowNode())).getAFalseSuccessor()  )+ "\n"        
           else result = ""
            // + getDigraphFormat(c, c.getANormalSuccessor())+"\n"
            + "Node:"+ c + ":" + getQuickLocation(c) + "\n"
            + "Type:Statement\n" 
            + "Predecessor:" + c.getAPredecessor() + ":" + getQuickLocation(c.getAPredecessor()) + "\n"
            + "Successor:" + c.getANormalSuccessor() + ":" + getQuickLocation(c.getANormalSuccessor()) + "\n"
                 
             
 }

 string getNodeType(ControlFlowNode c) {
     if (c instanceof IfStmt)
     then result = "ConditionalBranch"
     else
         if (c instanceof TryStmt)
         then result = "TryCatch"
         else
            if (c instanceof ForStmt)
            then result = "ForLoop"
            else result = "Statement"
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

from  ControlFlowNode c
where  c.getEnclosingCallable().getDeclaringType().getName().matches("SegmentIteratorImpl") //and c.getAPrimaryQlClass().matches("%Stmt") //and (c.getANormalSuccessor() != c.getAnExceptionalSuccessor() or c.getATrueSuccessor() != c.getAFalseSuccessor() or c instanceof IfExprNode or c instanceof ForNode)
      and c.getEnclosingCallable().getName().matches("%resetToPath%")
//where c.getEnclosingCallable().getDeclaringType().getName().matches("BucketSort")
select c, formatOutput1(c)