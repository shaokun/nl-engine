module Hr
  class Engine < ::Rails::Engine
    class MyEngine < Rails::Engine
      paths["app/controllers"] << "lib/placeholder/controllers"
    end
  end
end
