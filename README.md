# Deploying ontologies using Roxy

Ontologies and taxonomies sit in an awkward space within the Roxy framework - this inflated gist is my work-around for loading triple-based reference data.

There are 4 parts to an ontology or taxonomy deployment using Roxy

* Database configured for triples
* Custom module /src/app/lib/ontology/install_ontologies.xqy
* Ontologies should be in turtle format and located within the /data/ontology directory
* Customise /deploy/app_specific.rb

## Database configured for triples

TODO: howto - modify database xml config

## install_ontologies module

sth here
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

Ontologies are loaded into their own "ontology" graph for ease of discovery
