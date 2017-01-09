class Box < ApplicationRecord

  scope :get_box, ->() {
    if Box.all.length < 1
      Box.create active: false, description: 'caja'
    end

    Box.first
  }
end
