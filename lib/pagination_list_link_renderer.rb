class PaginationListLinkRenderer < WillPaginate::ActionView::LinkRenderer
  protected

  def page_number(page)
    if page == current_page
      tag(:li, tag(:span, page), class: 'paginate_button active')
    else
      tag(:li, link(page, page, rel: rel_value(page)))
    end
  end

  def gap
    text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
    %(<span class="gap">#{text}</span>)
  end

  def previous_page
    num = @collection.current_page > 1 && @collection.current_page - 1
    previous_or_next_page(num, @options[:previous_label], 'paginate_button')
  end

  def next_page
    num = @collection.current_page < total_pages && @collection.current_page + 1
    previous_or_next_page(num, @options[:next_label], 'paginate_button')
  end

  def previous_or_next_page(page, text, classname)
    if page
      tag(:li, link(text, page), class: classname)
    else
      tag(:li, tag(:span, text), class: "#{classname} disabled")
    end
  end

  def html_container(html)
    tag(:ul, html, class: 'pagination pull-right')
  end

  def url(page)
    @base_url_params ||= begin
      url_params = merge_get_params(default_url_params)
      url_params[:only_path] = true
      merge_optional_params(url_params)
    end

    url_params = @base_url_params.dup
    add_current_page_param(url_params, page)

    @template.url_for(url_params)
  end
end
