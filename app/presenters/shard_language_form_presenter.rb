class ShardLanguageFormPresenter < BasePresenter
  presents :shard_language

  def domain
    form_field(:domain, f.text_field(:domain))
  end

  def domain_aliases
    # form_field(:domain_aliases, f.text_area(:domain_aliases, rows: 5))
    form_field(:domain_aliases, h.text_area_tag("shard_language[domain_aliases]", shard_language.domain_aliases))
  end

  def commentatr_token
    form_field(:commentatr_token, f.text_field(:commentatr_token))
  end

  def language_id(languages)
    form_field(:language_id, f.select(:language_id, languages.collect{ |l| [ l.name, l.id ] }))
  end

end
