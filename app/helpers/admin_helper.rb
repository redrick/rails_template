module AdminHelper
  def pagination(collection)
    content_tag :div, class: 'row' do
      info = content_tag :div, class: 'col-md-6' do
        content_tag(:div, class: 'pagination') { page_entries_info(collection) }
      end
      pagination = content_tag :div, class: 'col-md-6' do
        will_paginate(collection, renderer: ::PaginationListLinkRenderer)
      end
      info + pagination
    end
  end
end
