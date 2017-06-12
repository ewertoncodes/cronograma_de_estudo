Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :activities
  patch 'activities/increase_priority/:id', to: 'activities#increase_priority',
  as: 'activity_increase_priority'
  patch 'activities/decrease_priority/:id', to: 'activities#decrease_priority',
  as: 'activity_decrease_priority'

end
