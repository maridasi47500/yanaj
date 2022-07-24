Rails.application.routes.draw do
get "recherche", to: "home#search"
get "/actualites-articles/page/:page", to: "news#index", as: :newspage 

get "/actualites-articles/:category/:title", to: "news#show", as: :mynews 
get "/actualites-articles", to: "news#index",as: :indexnews  
get "/evenement/:title", to: "events#show", as: :event 
get "agenda", to: "events#index", as: :agenda 
get "agenda/page/:page", to: "events#index", as: :agendapage 
get "/categorie/:name/", to: "categories#show", as: :showcat
get "/thematique/:name/", to: "topics#show", as: :topic
get "/dispositif/:name/", to: "plans#show",as: :plan
get "page-pro*title", to: "pagepros#show"
root to: 'home#index'
    get '*unmatched_route', :to => 'home#raisenotfound'
end
