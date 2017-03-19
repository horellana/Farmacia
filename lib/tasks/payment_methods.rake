namespace :payment_methods do
  task create: :environment do
    PaymentMethod.new(description: 'Efectivo').save!
    PaymentMethod.new(description: 'Redcompra').save!
  end
end
