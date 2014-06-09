# encoding: utf-8
class Catalog  < ActiveRecord::Base
	validates :name, :presence => true

	default_scope order('position DESC')

	has_many :articles

	has_ancestry  

	default_value_for :status, 1

	scope :with_tags, where("tags <> ''")
	scope :common, where("lx_id <> 1")
	scope :banner, where(:lx_id => 1)
	scope :lx, lambda{|lx_id| where(:lx_id => lx_id) }
	scope :show, where("status = 1") 

	def self.middle
		middle_menus.first
	end

	def self.foot_left
		self.where(:lx_id => 2).first
	end

	def self.foot_middle
		self.where(:lx_id => 3).first
	end

	def self.foot_right
		self.where(:lx_id => 4).first
	end

	def self.at(name)
		find_by_name(name)
	end

	def self.on(name)
		at(name).try(:subtree)
	end

	def self.articles(name, sub = true)
		on(name) ? (sub ? on(name).map(&:articles).flatten : at(name).articles) : []
	end

	def article
		articles.where(:cat => true).first
	end

end
