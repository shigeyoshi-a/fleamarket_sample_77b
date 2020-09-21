class SendingDays < ActiveHash::Base
  include ActiveHash::Associations
  has_many :products

  self.data = [{id:1, name: "1〜2日で発送"}, {id:2, name: "2〜3日で発送"}, {id:3, name: "4〜7日で発送"}]

end