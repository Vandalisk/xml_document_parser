class AbstractXmlParser
  def initialize(xml_file_path)
    @file_path = xml_file_path
  end

  def parse!
    doc = Nokogiri::XML(File.open(@file_name))

    namespaces = doc.namespaces

    doc.xpath("//ns2:body//ns2:item//ns2:purchaseNoticeData").each do |item|

    end
  end
end
