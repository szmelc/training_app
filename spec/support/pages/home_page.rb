class HomePage < SitePrism::Page
  set_url '/'
  section :menu, MenuSection, '.navbar-default'
end
