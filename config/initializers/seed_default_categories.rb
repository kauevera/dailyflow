Rails.application.config.after_initialize do
  next unless Rails.env.development? || Rails.env.production?

  begin
    next unless ActiveRecord::Base.connection.table_exists?(:users) &&
                ActiveRecord::Base.connection.table_exists?(:categories)

    User.find_each do |user|
      user.seed_default_categories if user.categories.empty?
    end
  rescue StandardError => e
    Rails.logger.warn "[seed_default_categories] #{e.message}"
  end
end
