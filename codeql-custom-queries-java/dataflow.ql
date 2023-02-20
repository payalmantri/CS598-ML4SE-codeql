/**
 * @name Empty block
 * @kind problem
 * @problem.severity warning
 * @id java/example/empty-block
 */


import java
import semmle.code.java.dataflow.DataFlow

// from File fl, Assignment asn
// where fl.getBaseName() = "StringUtils.java"
// and asn.getLocation().getFile() = fl 
// // // and (asn instanceof Assignment or asn instanceof LocalVariableDeclExpr)
// // // and use.getLocation().getFile() = fl
// // // and def.isDefinition() and use.isUse()
// // // and def.getLocation().getStartLine() = use.getLocation().getStartLine()
// // // and not def.isConstant()
// // // and not use.isConstant()
// select asn, asn.getDest() + "->" + asn.getSource()

// string formatDeclaration(LocalVariableDeclExpr ld, VarAccess va) {
//     result = ld.getVariable().getName() + "->" + va.getVariable().getName() + "\n"
// }

// string formatUse(Assignment asn) {
//     result  = asn.getDest() + "->" + asn.getSource() + "\n"
// }

from File fl, LocalVariableDeclExpr ld, VarAccess va, Assignment asn
where 
(
    (//fl.getBaseName() = "StringUtils.java"
    //or fl.getBaseName() = "SegmentBuffer.java"
    fl.getBaseName() = "SegmentIteratorImpl.java") 
 //and c.getAPrimaryQlClass().matches("%Stmt") //and (c.getANormalSuccessor() != c.getAnExceptionalSuccessor() or c.getATrueSuccessor() != c.getAFalseSuccessor() or c instanceof IfExprNode or c instanceof ForNode)
    and 
    
    (
    ld.getEnclosingCallable().getName().matches("%_updateSegment%") 
    and va.getEnclosingCallable().getName().matches("%_updateSegment%")
    )
    
    
    
)
and ld.getLocation().getFile() = fl 
and va.getLocation().getFile() = fl 
and asn.getLocation().getFile() = fl 
and va.getLocation().getStartLine() = ld.getLocation().getStartLine()
// and v1.getInitializer().getLocation().getStartLine() = v2.getAnAccess().getLocation().getStartLine()
select ld, "\"" + va.getVariable().getName()+"\""  + "->" + "\"" +ld.getVariable().getName()+"\""  + "\n" + "\"" +asn.getDest()+"\""  + "->" + "\"" +asn.getSource()+"\""  + "\n"


// from File fl, LocalVariableDeclExpr ld, VarAccess va, Assignment asn
// where fl.getBaseName() = "SegmentBuffer.java"
// and ld.getLocation().getFile() = fl 
// and va.getLocation().getFile() = fl 
// and asn.getLocation().getFile() = fl 
// and va.getLocation().getStartLine() = ld.getLocation().getStartLine()
// // and v1.getInitializer().getLocation().getStartLine() = v2.getAnAccess().getLocation().getStartLine()
// select ld, //formatDeclaration(ld, va)// + formatUse(asn) 
