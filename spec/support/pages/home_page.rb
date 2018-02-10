class Home < SitePrism::Page
  set_url '/'
  section :menu, MenuSection, ".navbar-default"
  section :posts, PostsSection, ".posts"
end
