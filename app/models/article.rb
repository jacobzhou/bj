# encoding: utf-8
class Article  < ActiveRecord::Base
  belongs_to :catalog, :counter_cache => true

  default_scope order('articles.position DESC, articles.updated_at DESC')

  scope :published, where(:published => true)
  scope :can_show, published.order('published_at DESC')
  scope :by_position, published.order('position DESC, published_at DESC')

  validates :title, :presence => true
  validates :content, :presence => true
  validates :catalog_id, :presence => true
  validates :position, :presence => true

  has_many :attachments, :as => :attable
  accepts_nested_attributes_for :attachments, :reject_if => lambda { |item| item[:file].blank? }, :allow_destroy => true

  def cover
    attachments.where(:lx => "头像").first.try(:file)
  end

  def covers
    attachments.where(:lx => "头像")
  end

  def tag_articles
    Article.where(:tag => self.tag) if self.tag.present?
  end

end
