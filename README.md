# Deploying ontologies using Roxy

There are 4 parts to an ontology or taxonomy deployment using Roxy

* Database configured for triples
* Custom module /src/app/lib/ontology/install_ontologies.xqy
* Ontologies should be in turtle format and located within the /data/ontology directory
* Customise /deploy/app_specific.rb

## Database configured for triples

sth here - how to

## install_ontologies module

sth here
* TODO: alter the module to check the filename qualifier

## Turtle format ontologies

Turtle is (from a personal perspective, at time of print) the easiest format to read. See
http://www.w3.org/TR/turtle/ for more details

## Customise app_specific

See http://stackoverflow.com/questions/10337712/recommended-approach-to-monkey-patching-a-class-in-ruby for the dangers involved (not many).

Add the following line to your deploy/app_specific.rb file:

```
require 'ontology_specific'

```

(I add it at the bottom to ensure the class already exists, but I believe that there are no issues with adding it at the top)

## Deployment

Follow these steps to deploy:
```
./ml local bootstrap
./ml local deploy modules
./ml local deploy content
./ml local deploy_ontologies
```
