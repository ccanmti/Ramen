class Form::BusinesshourCollection < Form::Base
  FORM_COUNT = 5
  attr_accessor :businesshours

  def initialize(attributes = {})
    super attributes
    self.businesshours = FORM_COUNT.times.map { Businesshour.new() } unless self.businesshours.present?
  end

  # 上でsuper attributesとしているので必要
  def businesshours_attributes=(attributes)
    self.businesshours = businesshours.map { |_, v| Businesshour.new(v) }
  end

  def save
    # 実際にやりたいことはこれだけ
    # self.memos.map(&:save!)

    # 複数件全て保存できた場合のみ実行したいので、transactionを使用する
    Businesshour.transaction do
      self.businesshours.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end