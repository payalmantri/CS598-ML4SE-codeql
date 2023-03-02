/**
 * @name Empty block
 * @kind problem
 * @problem.severity warning
 * @id java/example/empty-block
 */


import java
import semmle.code.java.dataflow.DataFlow


/*
 * 
 * Query 1: Get variables that are defined elsewhere, but reassigned
 */
from File fl, Assignment asn
where fl.getBaseName() = "SegmentIteratorImpl.java"
and asn.getEnclosingCallable().getName().matches("%previousSegment%")
and asn.getLocation().getFile() = fl 
select asn, "\"" +asn.getDest()+"\""  + "->" + "\"" +asn.getSource()+"\""  + "\n"

/*
 * 
 * Query 2: get variables that are declared and defined in the same statement.
 */

// from File fl, LocalVariableDeclExpr ld, VarAccess va
// where fl.getBaseName() = "SegmentIteratorImpl.java"
// and ld.getEnclosingCallable().getName().matches("%resetToVertex%") 
// and va.getEnclosingCallable().getName().matches("%resetToVertex%")
// and ld.getLocation().getFile() = fl 
// and va.getLocation().getFile() = fl 
// and va.getLocation().getStartLine() = ld.getLocation().getStartLine()
// and v1.getInitializer().getLocation().getStartLine() = v2.getAnAccess().getLocation().getStartLine()
// select va, "\"" + va.getVariable().getName()+"\""  + "->" + "\"" +ld.getVariable().getName()+"\""  + "\n"





// from File fl, LocalVariableDeclExpr ld, VarAccess va, Assignment asn
// where fl.getBaseName() = "SegmentBuffer.java"
// and ld.getLocation().getFile() = fl 
// and va.getLocation().getFile() = fl 
// and asn.getLocation().getFile() = fl 
// and va.getLocation().getStartLine() = ld.getLocation().getStartLine()
// // and v1.getInitializer().getLocation().getStartLine() = v2.getAnAccess().getLocation().getStartLine()
// select ld, //formatDeclaration(ld, va)// + formatUse(asn) 
