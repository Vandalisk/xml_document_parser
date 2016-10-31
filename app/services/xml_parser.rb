class XmlParser
  def initialize(xml_file_path)
    @file_path = xml_file_path
  end

  def parse!
    doc = Nokogiri::XML(File.open(@file_path))
    namespaces = doc.namespaces
    namespace = "//ns2:"
    notice_nodes = doc.xpath(namespace + "purchaseNoticeData")
    # TODO: change model determination
    primary_model = 'Purchase'.constantize

    grabber = AttributesGrabber.new(primary_model, notice_nodes, namespace)
    attributes = grabber.grab!

    primary_model.create(attributes)
  end
end
