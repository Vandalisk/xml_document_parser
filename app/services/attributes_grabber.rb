class AttributesGrabber
  def initialize(primary_model, nodes)
    @primary_model = primary_model
    @nodes = nodes
  end

  def get_attributes
    attributes = get_primary_attributes

    @primary_model.associated_models.each do |associated_model_key, value|
      model_nodes = @nodes.xpath("//ns2:#{associated_model_key}")
      next if model_nodes.size == 0
      associated_model = AbstractModel.new(value[:class])

      associated_attributes = get_associated_attributes(associated_model, model_nodes, value)

      attributes[value[:nested_key]] = associated_attributes
    end

    attributes
  end

  private

  def get_primary_attributes
    @primary_model.columns.inject({}) do |hash, column|
      hash[column.underscore] = @nodes.xpath("//ns2:#{column}").text
      hash
    end
  end

  def get_associated_attributes(associated_model, nodes, attrs)
    if attrs[:type] == 'has_many'
      nodes = nodes.search(attrs[:item_key])
      nodes.inject([]) do |array, node|
        array << get_associated_attributes(associated_model, node, attrs.slice(:class))
        array
      end
    else
      attributes = get_model_attributes(associated_model, nodes)
      associated_model.associated_models.each do |associated_model_key, value|
        model_nodes = nodes.search(associated_model_key)
        next if model_nodes.size == 0
        nested_associated_model = AbstractModel.new(value[:class])

        associated_attributes = get_associated_attributes(nested_associated_model, model_nodes, value)

        attributes[value[:nested_key]] = associated_attributes
      end

      attributes
    end
  end

  def get_model_attributes(associated_model, nodes)
    associated_model.columns.inject({}) do |hash, associated_column|
      res_node = nodes.at(associated_column)
      hash[associated_column.underscore] = res_node.text if res_node
      hash
    end
  end
end
