class Businesshour < ApplicationRecord
  belongs_to :shop

  validates :start_time, presence: true, format: { with: /[[0-2]0-9]:[0-5][0-9]/, message: "は[00:00]の形式で入力してください" }
  validates :end_time, presence: true, format: { with: /[[0-2]0-9]:[0-5][0-9]/, message: "は[00:00]の形式で入力してください" }



end
