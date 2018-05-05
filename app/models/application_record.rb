class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  extend ActiveHash::Associations::ActiveRecordExtensions
end
