/**
 * @name Empty block
 * @kind problem
 * @problem.severity warning
 * @id java/example/empty-block
 */


import java
import semmle.code.java.dataflow.DataFlow

from File fl, Assignment asn
where fl.getBaseName() = "StringUtils.java"
and asn.getLocation().getFile() = fl 
// // and (asn instanceof Assignment or asn instanceof LocalVariableDeclExpr)
// // and use.getLocation().getFile() = fl
// // and def.isDefinition() and use.isUse()
// // and def.getLocation().getStartLine() = use.getLocation().getStartLine()
// // and not def.isConstant()
// // and not use.isConstant()
select asn, asn.getDest() + "->" + asn.getSource()

// from File fl, LocalVariableDeclExpr ld, VarAccess va
// where fl.getBaseName() = "SegmentBuffer.java"
// and ld.getLocation().getFile() = fl 
// and va.getLocation().getFile() = fl 
// and va.getLocation().getStartLine() = ld.getLocation().getStartLine()
// // and v1.getInitializer().getLocation().getStartLine() = v2.getAnAccess().getLocation().getStartLine()
// select ld, ld.getVariable() + "->" + va.getVariable()

