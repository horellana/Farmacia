class StockValidator < ActiveModel::Validator
  def validate(record)
    if record.stock and record.stock < 0
      record.errors[:stock] << 'El stock no puede ser menor a 0!'
    end
  end
end
