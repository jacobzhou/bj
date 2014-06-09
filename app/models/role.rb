# encoding: utf-8
class Role  < ActiveRecord::Base
	validates :name, :presence => true
  validates :lx, :presence => true

	has_and_belongs_to_many  :users

end