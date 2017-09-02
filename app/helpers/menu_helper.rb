module MenuHelper
  def menu_link_to(controller, title, path, icon_name)
    content_tag :li, class: menu_item_active?(controller) do
      link_to path do
        concat(content_tag(:i, nil, class: get_icon(icon_name)))
        concat(content_tag(:span, title))
      end
    end
  end

  # def menu_with_submenu(title, heading, icon_name, &block)
  #   content_tag :li do
  #   end
  # end

  def sidebar_menu(title, &block)
    content_tag :ul, class: 'sidebar-menu tree', data: { widget: 'tree' } do
      concat(content_tag(:li, title, class: 'header'))
      concat(yield(block))
    end
  end

  private

  def menu_item_active?(controller)
    if controller.is_a? Array
      controller.include?(controller_name) ? 'active' : ''
    elsif controller.is_a? String
      controller_name == controller ? 'active' : ''
    else
      ''
    end
  end

  def get_icon(icon_name)
    icon_name.blank? ? 'fa empty' : "fa fa-#{icon_name}"
  end
end
