class XmlParser
  def initialize(xml_file_path)
    @file_path = xml_file_path
    @doc = Nokogiri::XML(File.open(@file_path))
  end

  def parse!
    namespaces = @doc.namespaces
    namespace = "//ns2:"
    # namespaces.each do |namespace, url|
    #   namespace = "//#{namespace}:"
    #   # TODO: how to determine node name
    #   nodes = @doc.xpath(namespace + "fcsNotificationZP")
    # end
    # notice_nodes = @doc.xpath(namespace + "purchaseNoticeData")

    notice_nodes = @doc.xpath(namespace + "fcsNotificationZP")
    # TODO: change model determination
    # primary_model = 'Purchase'.constantize
    primary_model = 'Export'.constantize
    # binding.pry
    grabber = AttributesGrabber.new(primary_model, notice_nodes, namespace)
    attributes = grabber.grab!

    primary_model.create(attributes)
  end

  # def namespaces
  #   @namespaces ||= @doc.namespaces.each_with_object({}) do |(namespace, url), new_hash|
  #     new_hash[namespace.split(':').last] = url
  #   end
  # end
end
