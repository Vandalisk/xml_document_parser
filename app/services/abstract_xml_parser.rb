class AbstractXmlParser
  def initialize(xml_file_path)
    @file_path = xml_file_path
  end

  def parse!
    doc = Nokogiri::XML(File.open(@file_path))

    namespaces = doc.namespaces

    # TODO: change model determination
    model = get_model('criteria')

    columns = model.columns_for_parsing

    notice_data = doc.xpath("//ns2:purchaseNoticeData")

    attributes = columns.inject({}) do |hash, column|
      hash[column.underscore] = notice_data.xpath("//ns2:#{column}").text
      hash
    end

    new_object = model.new(attributes)
  end

  def get_model(criteria)
    Purchase
  end
end
