class AbstractXmlParser
  def initialize(xml_file_path)
    @file_path = xml_file_path
  end

  def parse!
    doc = Nokogiri::XML(File.open(@file_path))

    namespaces = doc.namespaces
    notice_nodes = doc.xpath("//ns2:purchaseNoticeData")

    # TODO: change model determination
    primary_model = AbstractModel.new('Purchase')

    grabber = AttributesGrabber.new(primary_model, notice_nodes)

    ActiveRecord::Base.transaction do
      attributes = grabber.get_attributes
      binding.pry
      primary_model.create(attributes)
    end
  end
end
