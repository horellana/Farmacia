class NameValidator < ActiveModel::Validator
  def validate(record)
    if !record.name.nil? && solo_numeros(record.name)
      record.errors[:nombre] << 'no puede tener solo numeros'
    end
  end

  private
  def solo_numeros(str)
    str.chars.all? { |c| [0, 1, 2, 3, 4, 5, 6, 7 ,8 ,9].map(&:to_s).include?(c) }
  end
end
