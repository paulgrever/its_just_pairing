module LanguagesHelper
  def language_name
    lang = Language.all.map do |lang|
      [lang.name]
    end
  end
end
