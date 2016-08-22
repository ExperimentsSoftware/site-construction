class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

	def default_url_options
		{ locale: I18n.locale }
	end

	def get_locale locale
		aliases = {
			'br' => 'pt'
		}

		parsed_locale = aliases[locale] || locale
		I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
	end

	def set_locale
	  I18n.locale = locale_from_param || locale_from_domain || I18n.default_locale
	end

	def locale_from_param
		get_locale params[:locale]
	end

	def locale_from_domain
		get_locale request.host.split('.').last
	end
end
