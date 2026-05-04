class User < ApplicationRecord
  has_secure_password
  has_many :categories, dependent: :destroy
  has_many :tasks, dependent: :destroy

  after_create :seed_default_categories

  DEFAULT_CATEGORIES = [
    { nome: "Trabalho",  cor: "#d48166" },
    { nome: "Pessoal",   cor: "#83966a" },
    { nome: "Estudos",   cor: "#a39171" },
    { nome: "Saúde",     cor: "#c27069" },
    { nome: "Finanças",  cor: "#6b8cba" }
  ].freeze

  def seed_default_categories
    DEFAULT_CATEGORIES.each do |attrs|
      categories.find_or_create_by!(nome: attrs[:nome]) { |c| c.cor = attrs[:cor] }
    end
  end
end