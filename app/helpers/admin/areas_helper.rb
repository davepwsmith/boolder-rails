module Admin::AreasHelper
  def geojson_io_url(area)
    # For now we will just pass the geojson in the URL - this won't work long-term because it will be too long, but good for local
    "http://geojson.io/#data=data:application/json," + URI.encode_uri_component(geojson_string(area))
    # "http://geojson.io/#data=data:text/x-url," + URI.encode_www_form_component(geojson_source_url(area, prod_url: true))
  end

  def geojson_string(area)
    # This is copy-pasted from admin/maps_controller.rb - need to refactor it out
    # Or just bin it

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.with_location.where(area_id: area.id).map do |problem|
      hash = {}.with_indifferent_access
      hash[:name] = problem.name_debug
      hash[:problem_id] = problem.id
      hash[:updated_at] = problem.updated_at
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      # simple-style attributes to make the map look nicer on geojson.io
      # https://github.com/mapbox/simplestyle-spec/tree/master/1.1.0
      # Important: keep the key exactly as it it (don't camelize it)
      hash[:"marker-color"] = uicolor(problem.circuit&.color, fallback: "#ccc")

      factory.feature(problem.location, nil, hash)
    end

    boulder_features = Boulder.where(area_id: area.id).map do |boulder|
      hash = {}.with_indifferent_access
      hash[:boulder_id] = boulder.id
      hash[:updated_at] = boulder.updated_at
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(boulder.polygon, nil, hash)
    end

    feature_collection = factory.feature_collection(
      problem_features + boulder_features
    )

    JSON.generate(RGeo::GeoJSON.encode(feature_collection))
  end

  def geojson_source_url(area, download: false, prod_url: false)
    args = { download: download.presence }
    puts args
    args.merge!(host: "www.boolder.com", port: nil, protocol: "https") if prod_url

    admin_map_url(area_id: area.id, format: :geojson, **args)
  end
end
