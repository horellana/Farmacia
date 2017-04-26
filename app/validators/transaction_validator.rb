class TransactionValidator < ActiveModel::Validator
  def validate(record)
    validate_payed_amount(record)
  end

  private

  def validate_payed_amount(record)
    if record.total > record.calc_payed
      msg = "El monto de pago no puede ser menor a $#{record.total}!"
      record.errors[:payed_amount] << msg
    end
  end
end
