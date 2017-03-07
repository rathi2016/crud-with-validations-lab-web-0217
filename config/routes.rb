Rails.application.routes.draw do
  resources :songs ,only:[:edit,:new,:view,:update,:index,:create,:show,:destroy]
  delete 'song/:id',to: 'song#destroy'
end
