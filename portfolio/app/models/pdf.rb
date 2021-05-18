class Pdf < ApplicationRecord
    belongs_to :user, optional: true
    has_one_attached :pdf_file
end
