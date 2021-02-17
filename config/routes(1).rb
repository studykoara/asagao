Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "bad_request" => "top#bad_request" # TODO:エラー発生用コマンド3行
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"
  post "/members" => "accounts#create"

  1.upto(19) do |n|
    get "lesson/step#{n}(/:name)" => "lesson#step#{n}"
  end

  resources :members, only: [:index, :show] do  # 通常リソースのため複数形
    get "search", on: :collection  # メンバーの検索
    # patch "suspend", "restore", on: :member  # メンバーの停止・再開
    resources :entries, only: [:index]
    resources :duties
  end

  resource :session, only: [:create, :destroy] # 単体リソースのため単数形
  resource :account, only: [:show, :edit, :update, :new, :create]
  resource :password, only: [:show, :edit, :update]
  resources :entries do
    patch "like", "unlike", on: :member
    get "voted", on: :collection
    get "voted"
  end

  resources :entries

  namespace :admin do
    root to: "top#index"
    resources :members do
      get "search", on: :collection
    end
    resources :duties
  end
end
