# config/initializers/assets.rb
Rails.application.config.assets.precompile << Proc.new do |path|
  if path =~ /\.(css|js)\z/ && path !~ /bootstrap-social/
    full_path = Rails.application.assets_manifest.find_sources(path)
    if full_path.size == nil
      false
    else
      full_path = full_path.first.filename
      app_assets_path = Rails.root.join('app', 'assets').to_path
      if full_path.starts_with? app_assets_path
        #puts "including asset: " + full_path
        true
      else
        #puts "excluding asset: " + full_path
        false
      end
    end
  else
    false
  end
end
