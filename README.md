# Deploying ontologies using Roxy

On production systems, Ontologies and taxonomies should probably be loaded using MLCP - either from within the Roxy framework, or via separate scripts.

In pre-production, any pre-existing triples will be left in place, which leads to problems if ontologies are being swapped in or out.

This inflated gist is my work-around for loading triple-based reference data that is subject to change.

There are 4 parts to an ontology or taxonomy deployment using Roxy

* Database configured for triples
* Custom module /src/app/lib/ontology/install_ontologies.xqy
* Ontologies should be in turtle format and located within the /data/ontology directory
* Customise /deploy/app_specific.rb

## Database configured for triples

Enable the triple index by modifying the database xml config - add the following to ml-config.xml somewhere under <database> where the database-name is @ml.content-db :
```
<triple-index>true</triple-index>
```

## install_ontologies module

This script simply deletes all triples in the ontology graph, then inserts all ontologies discovered in the /data/ontology directory into the ontology graph
* TODO: alter the module to check the filename qualifier

## Turtle format ontologies

Turtle is (from a personal perspective, at time of print) the easiest format to read. See
http://www.w3.org/TR/turtle/ for more details

## Customise app_specific

See http://stackoverflow.com/questions/10337712/recommended-approach-to-monkey-patching-a-class-in-ruby for the dangers involved (not many).

Add the following line to the bottom of your deploy/app_specific.rb file:

```
require 'ontology_specific'

```

## Deployment

Follow these steps to deploy:
```
./ml local bootstrap
./ml local deploy modules
./ml local deploy content
./ml local deploy_ontologies
```

Ontologies are loaded into their own "ontology" graph for ease of discovery and deletion

## Re-deployment

To deploy an updated ontology, follow these steps:
```
./ml local deploy content
./ml local deploy_ontologies
```
Use the ontology graph with care; existing entries are deleted prior to redeployment.
