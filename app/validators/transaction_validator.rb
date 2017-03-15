class TransactionValidator < ActiveModel::Validator
  def validate(record)
    validate_payed_amount(record)
  end

  private

  def validate_payed_amount(record)
    puts record
    puts "record.total = #{record.total}"
    puts "record.payed_amount = #{record.payed_amount}"

    if record.total > record.payed_amount
      msg = "El monto de pago no puede ser menor a #{record.total}!"
      record.errors[:payed_amount] << msg
    end
  end
end
