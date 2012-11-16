module Exlibris
  module Primo
    module WebService
      module Request
        module ToXml
          def to_xml &block
            build_xml { |xml|
              xml.request {
                xml.cdata build_xml { |xml|
                  xml.send(root, 
                      "xmlns" => "http://www.exlibris.com/primo/xsd/wsRequest",
                      "xmlns:uic" => "http://www.exlibris.com/primo/xsd/primoview/uicomponents") {
                    yield xml if block
                    xml << base_elements
                  }
                }
              }
            }
          end
        end
      end
    end
  end
end