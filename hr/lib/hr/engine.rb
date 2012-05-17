module Hr
  class Engine < ::Rails::Engine
    paths["app/controllers"] << "lib/placeholder/controllers"
  end
end
