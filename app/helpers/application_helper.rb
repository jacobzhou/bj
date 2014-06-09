# -*- encoding : utf-8 -*-
module ApplicationHelper

  def stylesheets(*args)
    stylesheet_link_tag(*args) 
  end

  def javascripts(*args)
    javascript_include_tag(*args)
  end

  def include_my97
    javascripts "/plugins/My97DatePicker/WdatePicker.js"
  end

  def include_multiselect
    # jquery-ui.min.css
    # http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/ui-lightness/jquery-ui.css" />
    (stylesheets('http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/ui-lightness/jquery-ui.css', '/plugins/jquery.multiselect/jquery.multiselect.css',
  '/plugins/jquery.multiselect/jquery.multiselect.filter.css') +
    javascripts('jquery-ui.min.js', '/plugins/jquery.multiselect/jquery.multiselect.min.js',
  '/plugins/jquery.multiselect/jquery.multiselect.filter.js'))
  end

  def include_ui
    stylesheets '../plugins/jquery-ui-1.9.2.custom/css/custom-theme/jquery-ui-1.9.2.custom.min'
  end

  # Data.yml
  def d(value, data_key)
    v = Setting.send(data_key).find{ |vs| vs[1] == value }
    return v.blank? ? "" : v.first
  end

  # for title of html, in <head><title>here</title></head>
  def page_title(title = Settings.title)
    content_for(:title) { title }
  end

  def page_keywords(keywords)
    content_for(:keywords) { keywords }
  end

  def page_description(description)
    content_for(:description) { description }
  end

  def fix(content, object)
    content.gsub("{name}",object.name) if content.present?
  end

  def itag(text, type = '')
    style = ['label',type].compact.join('-')  
    "<span class='label #{style}'>#{text}</span>".html_safe
  end

  def tips(*args)
    content_tag(:div, :class => "alert alert-block") do  
      content_tag(:h5, "小贴士：", :class => "alert-heading") << 
      content_tag(:ol) do
        args.map{|arg| concat content_tag(:li, arg) }
      end
    end.html_safe
  end

  def picture(p, width, height, link = true)
    pic = p.is_a?(Picture) ? p : Picture.on(p).try(:first)   
    alt = "图片类型：" + (pic.try(:place) || p)
    img = image_tag(pic.try(:file).try(:url).to_s, width: width, height: height, border: 0, alt: alt)
    link ? link_to_blank(img, pic.try(:link)) : img
  end

  def breadcrumb_nav
    nav = ["当前位置：<a href='/'>首页</a>"]        
    if @catalog || @article
      @catalog ||= @article.catalog
      @catalog.ancestors.reverse.each do |catalog|
        nav << link_to(catalog.name)
      end
      nav << link_to(@catalog.name)
      nav << link_to(@article.title, @article) if @article
    end   
    content_tag(:p, :class=>"breadcrumb") do
      nav.join(" / ").html_safe
    end
  end
  
  def link_to_picture(picture, img_opts = {}, link_opts = {})
    img_opts = img_opts.merge({ :alt => picture.place })
    link_opts = link_opts.merge({ :title => picture.title })
    if picture.link =~ /^\//
      link_opts = link_opts.merge({ :target => '_blank' })
    end
    link_to_blank image_tag(picture.file.url, img_opts), picture.link, link_opts
  end
  

  def link(article)
    link_to_blank article.title, article_path(article)
  end
  

  def code(name)
    code = Code.at(name)
   # code.nil? ? "<h1 class='tc'>缺少代码片断：#{name}</h1>".html_safe : ERB.new(code.content).result(binding).html_safe
    ERB.new(code.content).result(binding).html_safe if code.present?
  end
  
  def status_prompt(status)
    case status.to_sym
    when :error
      "操作失败！"
    when :success
      "操作成功！" 
    when :notice
      "温馨提示："
    end
  end

  # admin edit and destroy links
  def eda_links(object)
    eval("link_to('修改', edit_admin_#{object.class.to_s.tableize.singularize}_path(#{object.id}))") << " " <<
    eval("link_to('删除', admin_#{object.class.to_s.tableize.singularize}_path(#{object.id}), :method => 'delete', :confirm =>'您确定吗？')")
    
    #
    #link_to '删除', admin_course_path(course), :method => 'delete', :confirm =>'您确定吗？'"
  end

  def link_to_blank(*args, &block)
    if block_given?
      args = [(args.first || {}), (args.second || {}).merge(:target => '_blank')]
    else
      args = [(args.first || {}), (args.second || {}), (args.third || {}).merge(:target => '_blank')]
    end
    link_to(*args, block)
  end

  def index_no(index, per)
    params[:page] ||= 1
    (params[:page].to_i - 1) * per + index + 1
  end

  def include_rich_text_editor
    javascripts("/plugins/kindeditor/kindeditor-min","/plugins/kindeditor/lang/zh_CN","editor")
  end

  def include_artdialog(style = "idialog")
    javascripts("/plugins/artDialog/artDialog.js") << 
    stylesheets("/plugins/artDialog/skins/#{style}")
  end

  def depth_mark(depth)
    "<span style='margin-left:#{10*depth}px'>|#{'--'*depth}</span>".html_safe if depth > 0
  end

  # def catalogs_select(object, options = {})
  #   options.merge!({:class => 'multi-level'})
  #   select_text = ''
  #   catalog = object.catalog

  #   while catalog and catalog.parent
  #     select_text = collection_select('catalog-parent-id', catalog.id, catalog.parent.children, :id, :name, {:selected => catalog.id, :prompt => '请选择'}, options) << select_text
  #     catalog = catalog.parent
  #   end
  #   select_text = collection_select('catalog-parent-id', 0, Catalog.roots, :id, :name, {:selected => catalog.try(:id), :prompt => '请选择'}, options) << select_text

  #   raw select_text
  # end
  def dynamic_selects(data_class, value_id, aim_id, options = {})
    options.merge!({:class => 'multi-level', :otype => data_class.to_s, :aim_id => aim_id})
    select_text = ''
    value_object = data_class.find_by_id(value_id)
    #aim_id = object.class.to_s.tableize.singularize + "_" + ref.to_s.singularize + "_id"

    while value_object and value_object.parent
      select_text = collection_select('value_object-parent-id', value_object.id, value_object.parent.children, :id, :name, {:selected => value_object.id, :prompt => '请选择'}, options) << select_text
      value_object = value_object.parent
    end
    select_text = collection_select('value_object-parent-id', 0, data_class.roots, :id, :name, {:selected => value_object.try(:id), :prompt => '请选择'}, options) << select_text

    raw select_text
  end

  def menu(text, link, object, last = nil)    
    html = content_tag :li, link_to(text, link)
    html << content_tag(:li, "", :class => "divider") unless last
    return html if can? :read, object
  end

  def y_status_label(y)
    state = case y.status
    when 0
      "success"
    when 1
      "warning"
    when 12
      "important"
    else
      ""
    end
    "<span class='badge badge-#{state}'>#{d(y.status, 'y_status')}</span>".html_safe
  end

  def y_info_html(y, *args)
    args.map do |cn|
      label = I18n.t "simple_form.labels.defaults.#{cn.is_a?(Array) ? cn[0] : cn}"
      value = cn.is_a?(Array) ? y.send(cn[0]).try(cn[1]) : y.send(cn)
      "<p>#{label}: <b>#{value}</b></p>"
    end.join.html_safe
  end

  # admin edit and destroy links
  def operate_buttons(object, options = {}, &block)
    lis = ""
    if object.is_a?(Array)
      lis = object.map{|link| "<li>#{link}</li>" }.join("")
    elsif object.present?
      options[:namespace] = "admin" if options[:namespace].nil?
      namespace = options[:namespace]
      links = []
      edit_path = eval("#{['edit', namespace, object.class.to_s.tableize.singularize, 'path'].compact.join('_')}(#{object.id},:back => request.fullpath)")
      destroy_path = eval("#{[namespace, object.class.to_s.tableize.singularize, 'path'].compact.join('_')}(#{object.id},:back => request.fullpath)")

      links << link_to('修改', edit_path)
      links << link_to('删除', destroy_path, :method => 'delete', :confirm =>'您确定吗？')
      links += options[:links] if options[:links].present?
      lis = links.map{|link| "<li>#{link}</li>" }.join("")
      if block_given?
        lis << capture(&block) 
      end
    end
    html = %Q|
      <div class="btn-group">
        <button class="btn btn-primary btn-small dropdown-toggle" data-toggle="dropdown">操作<span class="caret"></span></button>
        <ul class="dropdown-menu">
          #{lis}    
        </ul>
      </div>
    |.html_safe
  end
end
