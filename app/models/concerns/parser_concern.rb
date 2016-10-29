module ParserConcern
  extend ActiveSupport::Concern

  class_methods do
    def columns_for_parsing
      (column_names - self::NOT_INCLUDE).map { |column| column.camelize(:lower) }
    end

    def columns_without_associations
      column_names.select{ |i| !i[/\_id$/] }
    end
  end
end
