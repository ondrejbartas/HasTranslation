module SetLocaleHelper
  def set_locale
     # if params[:locale] is nil then I18n.default_locale will be used
     if I18n.available_locales.include?(params[:locale].to_sym)
       I18n.locale = params[:locale]
     end
  end
  
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
  
end