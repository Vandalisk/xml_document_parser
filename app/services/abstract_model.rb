class AbstractModel
  attr_reader :class_name
  def initialize(class_name)
    @class_name = class_name
  end

  def model
    @model ||= @class_name.constantize
  end

  def associated_models
    model::ASSOCIATED_MODELS
  end

  def columns
    model.columns_for_parsing
  end

  def create(attributes)
    new_model = model.new(attributes)

    raise ActiveRecord::Rollback unless new_model.save
  end
end
