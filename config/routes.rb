ArringtonVineyards::Application.routes.draw do
  get "/v2" => "pages#v2"
  get "/v3" => "pages#v3"
  get "/v4" => "pages#v4"
  root :to => "pages#index"

  mount RailPass::Engine, :at => "styleguide"
end
