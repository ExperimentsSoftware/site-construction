Rails.application.routes.draw do
	scope '(:locale)', locale: /en|pt|br/ do
		root to: "home#index"
	end
	root to: "home#index"
end
