class ShardFormPresenter < BasePresenter
  presents :shard

  def name
    form_field(:name, f.text_field(:name))
  end

  def gem_name
    form_field(:gem_name, f.text_field(:gem_name))
  end
  
  def setting(hash)
    key, val = "settings_#{hash.keys[0]}".to_sym, hash.values[0]
    if val.kind_of?(Numeric) || val.kind_of?(String) || val.kind_of?(Array)
      form_field(key, f.text_field(key))
    else val.kind_of?(TrueClass) || val.kind_of?(FalseClass) 
      form_field(key, f.check_box(key))
    end
  end

  def author_features
    form_field(:author_features, f.text_field(:author_features))
  end

  def master_features
    form_field(:master_features, f.text_field(:master_features))
  end
end
