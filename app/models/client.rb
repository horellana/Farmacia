class Client < ApplicationRecord
  has_many :transactions

  validates :name, presence: true
  validates :lastname, presence: true
  validates :rut, presence: true
  validates :rut, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates :address, presence: true
  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  #validates :gender, presence: true


  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

  def dv
      crut = self.rut.to_s
      f=2
      i=(crut.size) -1
      ss=0
      while i >= 0
        ss += f * ((crut[i].to_i) -48)
        f += 1
        f = 2 if f > 7
        i -= 1
      end
      ss = 11 - (ss % 11)
      if ss == 10
        "K"
      else
        if ss == 11
          "0"
        else
          ss.to_s
        end
      end
 end

  def self.from_rut(rut)
    begin
      return Client.find_by! rut: rut
    rescue ActiveRecord::RecordNotFound
      return Client.create rut: rut
    end
  end
end
