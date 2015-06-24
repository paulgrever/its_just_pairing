module LanguagesHelper
  def language_name
    lang = Language.all.map do |lang|
      [lang.name]
    end
  end

  def language_update
    if params['language'].present?
      params['language'].keys.each do |lang|
        @user.languages << Language.find_by(name: lang)
      end
    end
  end
end
