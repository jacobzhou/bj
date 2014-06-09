# encoding: utf-8
class Picture < ActiveRecord::Base
  PLACES = ['首页滚动图', '广告图片']

  default_scope order('position DESC')

  has_attached_file :file, :styles => { :thumb => "65x35#" }

  validates_attachment :file, :presence => true,
  :content_type => { :content_type => Setting.image_types }

  validates :alt, :presence => true
  validates :place, :presence => true

  scope :on, lambda{|place| where(:place => place) }
  
  def self.at(place)
    on(place).first
  end

end
