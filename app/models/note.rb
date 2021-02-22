class Note < ApplicationRecord
  belongs_to :user

  validates :title, presence: { message: "can't be blank if body is blank" }, if: -> { body.blank? }
  validates :title, length: { maximum: 30, too_long: "can't be more than %{count} characters" }
  validates :body, presence: { message: "can't be blank if title is blank" }, if: -> { title.blank? }
  validates :body, length: { maximum: 1000, too_long: "can't be more than %{count} characters" }

  before_save do
    self.title = self.body[0..29] if self.title.blank?
  end
end
