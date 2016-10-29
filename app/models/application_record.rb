# Please include ASSOCIATED_MODELS and NOT_INCLUDE constants to use ParserConcern in your model.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include ParserConcern
end
