#
#
# Class extension to deploy ontologies and taxonomies
# Thanks to Richard Clayton for the code below
# https://rclayton.silvrback.com/writing-and-deploying-triggers-in-marklogic-roxy
#
#
class ServerConfig

  ONTOLOGY_MODULE_INSTALL_PATH = "src/app/lib/ontology/"

  def deploy_ontologies
    filepath = ONTOLOGY_MODULE_INSTALL_PATH + "install-ontologies.xqy"
    file_as_string = get_file_as_string(filepath)
    result = execute_query(
      file_as_string, :app_name => @properties["ml.app-name"])
  end

  # Read the specified file and return a string with its contents.
  # @param filename File to Read
  # @return string contents of the file.
  def get_file_as_string(filename)
    data = ''
    File.open(filename, "r").each_line { |line| data += line }
    return data
  end
end
