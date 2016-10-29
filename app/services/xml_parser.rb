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

    ActiveRecord::Base.transaction do
      attributes = grabber.grab!
      new_model = primary_model.new(attributes)
      raise ActiveRecord::Rollback unless new_model.save
    end
  end
end
