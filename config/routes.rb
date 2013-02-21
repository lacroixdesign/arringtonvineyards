ArringtonVineyards::Application.routes.draw do
  get ":action", controller: "pages"
  root :to => "pages#index"

  mount RailPass::Engine, :at => "styleguide"
end
