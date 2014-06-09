# encoding: utf-8
class Attachment < ActiveRecord::Base
  belongs_to :attable, :polymorphic => true
  mount_uploader :file, PhotoUploader

  default_scope order('attachments.created_at DESC')

  attr_protected

  scope :covers, where(:lx => "头像")
  scope :id_cards, where(:lx => "身份证")
  scope :zs, where(:lx => "证书")
  scope :qt, where(:lx => "其他")
end