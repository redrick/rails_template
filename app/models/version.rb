class Version < PaperTrail::Version
  # rubocop:disable Rails/InverseOf
  belongs_to :author,
    class_name: 'AdminUser',
    foreign_key: 'whodunnit',
    optional: true
  # rubocop:enable Rails/InverseOf
end
