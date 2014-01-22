class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_admin_locale
  before_filter :set_locale

  def set_admin_locale
    I18n.locale = :pl
  end

  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_accept_language_header
    I18n.locale = extract_locale_from_accept_language_header if I18n.locale != :pl && I18n.locale != :en
  end

  def default_url_options(options={})
    {:locale => I18n.locale}
  end

  private

  def extract_locale_from_accept_language_header
    lang = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first unless request.env['HTTP_ACCEPT_LANGUAGE'].nil?
    lang = I18n.default_locale if lang != 'pl' && lang != 'en'
    lang
  end
end
