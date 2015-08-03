xquery version "1.0-ml";

(: Clear out the old ontologies first:)
for $doc in collection("ontology")
  let $uri := fn:base-uri($doc)
  return
    (
      xdmp:log(fn:concat("Removing ontology data in ", $uri, "..")),
      xdmp:document-delete($uri)
    )
;

import module namespace sem = "http://marklogic.com/semantics" at "/MarkLogic/semantics.xqy";

for $ontology in cts:uri-match("/ontology/*")
return (
  xdmp:log(fn:concat("Installing ontology ", $ontology, "..")),
  sem:rdf-insert( sem:rdf-parse( doc($ontology), "turtle" ), (), (), ('ontology'))
)
