class XmlParser
  def initialize(xml_file_path)
    @file_path = xml_file_path
  end

  def parse!
    doc = Nokogiri::XML(File.open(@file_path))

    namespaces = doc.namespaces
    notice_nodes = doc.xpath("//ns2:purchaseNoticeData")

    # TODO: change model determination
    primary_model = 'Purchase'.constantize

    grabber = AttributesGrabber.new(primary_model, notice_nodes)

    ActiveRecord::Base.transaction do
      attributes = grabber.get_attributes
      new_model = primary_model.new(attributes)
      raise ActiveRecord::Rollback unless new_model.save
    end
  end
end
