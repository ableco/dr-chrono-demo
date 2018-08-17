Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  get 'redirect' => 'redirect#index'

  get 'phi/patients' => 'phi#patients'

  get 'phi/lab_results' => 'phi#lab_results'
end
