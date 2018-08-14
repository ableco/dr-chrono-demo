Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  get 'redirect' => 'redirect#index'
end
