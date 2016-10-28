module ParserConcern
  extend ActiveSupport::Concern

  class_methods do
    def columns_for_parsing
      (column_names - self::NOT_INCLUDE).map do |column|
      # (columns_without_associations - self::NOT_INCLUDE + self::ASSOCIATED_MODELS).map do |column|
        column.camelize(:lower)
      end
    end

    def columns_without_associations
      column_names.select{ |i| !i[/\_id$/] }
    end
  end
end
