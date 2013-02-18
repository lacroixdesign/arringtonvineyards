ArringtonVineyards::Application.routes.draw do
  get "background" => "pages#background"
  get "horizontal" => "pages#horizontal"
  get "grid" => "pages#grid"
  root :to => "pages#index"

  mount RailPass::Engine, :at => "styleguide"
end
