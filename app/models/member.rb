class Member < ApplicationRecord
  has_secure_password
  
  has_many :entries, dependent: :destroy
  has_many :duties, dependent: :nullify
  has_many :votes, dependent: :destroy
  has_many :voted_entries, through: :votes, source: :entry
  has_one_attached :profile_picture
  attribute :new_profile_picture
  attribute :remove_profile_picture, :boolean
  attribute :new_duty_ids, :intarray, default:[]
  
  validates :number, presence: true,
    numericality: {
      only_integer: true,  # 整数のみ
      greater_than: 0,     # 1以上
      less_than: 100,      # 100未満
      allow_blank: true    # 空の背番号
    },
    uniqueness: true
  validates :name, presence: true,
    format: {
      with: /\A[A-Za-z][A-Za-z0-9]*\z/,  # 半角英数のみ
      allow_blank: true,                 # 空を禁止
      message: :invalid_member_name
    },
    length: { minimum: 2, maximum: 20, allow_blank: true }, # 2以上20以下の文字数
    uniqueness: { case_sensitive: false } # 大文字小文字区別しないで重複禁止
  validates :full_name, presence: true, length: { maximum: 20 } # 空禁止,20文字以下
  validates :email, email: { allow_blank: true }

  attr_accessor :current_password
  validates :password, presence: { if: :current_password }

  validate if: :new_profile_picture do
    if new_profile_picture.respond_to?(:content_type)
      unless new_profile_picture.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_profile_picture, :invalid_image_type)
      end
    else
      errors.add(:new_profile_picture, :invalid)
    end
  end

  def votable_for?(entry)
    entry && entry.author != self && !votes.exists?(entry_id: entry.id)
  end
  
  after_initialize do
    new_duty_ids.push(duty_ids)
    new_duty_ids.flatten!
  end

  before_save do
    if new_profile_picture
      self.profile_picture = new_profile_picture
    elsif remove_profile_picture
      self.profile_picture.purge
    end
    self.duty_ids = new_duty_ids
  end

  class << self
    def search(query)
      rel = order("number")
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?",
          "%#{query}%", "%#{query}%")
      end
      rel
    end
  end

  # validates :new_duty_ids, inclusion: { in: :duty_ids, message: "その当番はもう選択されています。" }
end
