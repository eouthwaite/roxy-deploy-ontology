xquery version "1.0-ml";

import module namespace sem = "http://marklogic.com/semantics" at "/MarkLogic/semantics.xqy";

for $ontology in cts:uri-match("/ontology/*")
return (
  xdmp:log(fn:concat("Installing ontology ", $ontology, "..")),
  sem:rdf-insert( sem:rdf-parse( doc($ontology), "turtle" ), (), (), ('ontology'))
)
