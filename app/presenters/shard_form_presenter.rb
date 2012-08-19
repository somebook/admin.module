class ShardFormPresenter < BasePresenter
  presents :shard

  def name
    form_field(:name, f.text_field(:name))
  end

  def gem_name
    form_field(:gem_name, f.text_field(:gem_name))
  end

  def author_features
    form_field(:author_features, f.text_field(:author_features))
  end

  def master_features
    form_field(:master_features, f.text_field(:master_features))
  end
end
