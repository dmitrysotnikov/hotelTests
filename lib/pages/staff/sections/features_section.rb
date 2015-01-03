class FeaturesSection < SitePrism::Section

  element :info_features_field, '.feature_items #info_item_feature_items_attributes_0_translations_en_name'
  element :link_features_field, '.feature_items #link_item_feature_items_attributes_0_translations_en_name'

end