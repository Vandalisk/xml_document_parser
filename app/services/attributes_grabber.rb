class AttributesGrabber
  def initialize(primary_model, nodes, namespace)
    @primary_model = primary_model
    @nodes = nodes
    @namespace = namespace
  end

  def grab!
    get_associated_attributes(@primary_model, @nodes, @namespace)
  end

  private

  def get_associated_attributes(model, nodes, prefix = '')
    attributes = get_attributes(model, nodes, prefix)

    model::ASSOCIATED_MODELS.each do |model_key, value|
      model_nodes = nodes.search(prefix + model_key.to_s)
      next if model_nodes.size == 0
      nested_model = value[:class].constantize

      associated_attributes = get_nested_attributes(nested_model, model_nodes, value)

      attributes[value[:nested_key]] = associated_attributes
    end

    attributes
  end

  def get_attributes(model, nodes, prefix = '')
    model.columns_for_parsing.inject({}) do |hash, column|
      result_node = nodes.at(prefix + column)
      hash[column.underscore] = result_node.text if result_node
      hash
    end
  end

  def get_nested_attributes(model, nodes, attrs)
    if attrs[:type] == 'has_many'
      nodes = nodes.search(attrs[:item_key])
      nodes.inject([]) do |array, node|
        array << get_nested_attributes(model, node, attrs.slice(:class))
        array
      end
    else
      get_associated_attributes(model, nodes)
    end
  end
end
