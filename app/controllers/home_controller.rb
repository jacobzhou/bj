# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index
    @middle_catalog = Catalog.middle
    @middle_articles = @middle_catalog.articles.limit(3)
    @foot_left_catalog = Catalog.foot_left
    @foot_left_articles = @foot_left_catalog.articles.limit(8)
    @foot_middle_catalog = Catalog.foot_middle
    @foot_middle_articles = @foot_middle_catalog.articles.limit(2)
    @foot_right_catalog = Catalog.foot_right
    @foot_right_articles = @foot_right_catalog.articles.limit(2)
    @pics = Catalog.lx(5).first.articles.limit(6)
  end
  
  def test
    dsdad
  end

  def bj_index
    @gg = Picture.at("广告图片")
    @gdt = Picture.on("首页滚动图").limit(4)
    catalogs = Catalog.common.show.limit(5)
    @c0 = catalogs[0].presence.try(:articles).try(:limit, 6) || []
    @c1 = catalogs[1].presence.try(:articles).try(:limit, 6) || []
    @c2 = catalogs[2].presence.try(:articles).try(:limit, 6) || []
    @c3 = catalogs[3].presence.try(:articles).try(:limit, 6) || []
    @c4 = catalogs[4].presence.try(:articles).try(:limit, 6) || []
  end
end
