module BreadcrumbHelper
  def ensure_breadcrumbs
    @breadcrumbs ||= [{:name => 'Главная', :url => '/'}]
  end

  def add_breadcrumb name, url
    ensure_breadcrumbs << {:name => name, :url => url}
  end

  def render_breadcrumbs
    render :partial => "common/breadcrumb", :locals => {:crumbs => ensure_breadcrumbs}
  end
end
