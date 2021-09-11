if Rails.env.development?
  AdminUser.delete_all
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end

Caffeinate::Campaign.find_or_create_by!(name: "Onboarding", slug: :onboarding)
