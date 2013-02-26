ArringtonVineyards::Application.routes.draw do
  # TODO remove for production
  resource :prototypes do
    get ":action"
    root to: "prototypes#index"
  end

  root to: "pages#index"
end
