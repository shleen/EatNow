class Staff < User
  belongs_to :stall

  enum staff_type: [:owner, :employee]
end
