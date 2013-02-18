ArringtonVineyards::Application.routes.draw do
  root :to => "pages#index"

  mount RailPass::Engine, :at => "styleguide"
end
