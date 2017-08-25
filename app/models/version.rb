class Version < PaperTrail::Version
  belongs_to :author,
    class_name: 'AdminUser',
    foreign_key: 'whodunnit'
end
